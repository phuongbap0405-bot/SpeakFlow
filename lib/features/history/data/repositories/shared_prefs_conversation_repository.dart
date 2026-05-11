import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/session.dart';
import '../../domain/repositories/conversation_repository.dart';
import '../../../../core/error/exceptions.dart';

@Injectable(as: ConversationRepository)
class SharedPrefsConversationRepository implements ConversationRepository {
  static const _storageKey = 'speakflow_sessions';

  final SharedPreferences _prefs;

  SharedPrefsConversationRepository(this._prefs);

  @override
  Future<void> saveSession(Session session) async {
    try {
      final sessions = await _loadSessions();
      final index = sessions.indexWhere((s) => s.id == session.id);
      if (index >= 0) {
        sessions[index] = session;
      } else {
        sessions.add(session);
      }
      final jsonString = jsonEncode(sessions.map((s) => s.toJson()).toList());
      await _prefs.setString(_storageKey, jsonString);
    } catch (e) {
      throw StorageException('Failed to save session: $e');
    }
  }

  @override
  Future<List<Session>> getAllSessions() async {
    try {
      final sessions = await _loadSessions();
      sessions.sort((a, b) => b.startTime.compareTo(a.startTime));
      return sessions;
    } catch (e) {
      throw StorageException('Failed to load sessions: $e');
    }
  }

  @override
  Future<Session?> getSessionById(String id) async {
    try {
      final sessions = await _loadSessions();
      final matches = sessions.where((s) => s.id == id);
      return matches.isEmpty ? null : matches.first;
    } catch (e) {
      throw StorageException('Failed to retrieve session by id: $e');
    }
  }

  Future<List<Session>> _loadSessions() {
    final jsonString = _prefs.getString(_storageKey);
    if (jsonString == null || jsonString.isEmpty) {
      return Future.value([]);
    }
    final List<dynamic> decoded = jsonDecode(jsonString) as List<dynamic>;
    final sessions = decoded
        .map((e) => Session.fromJson(e as Map<String, dynamic>))
        .toList();
    return Future.value(sessions);
  }
}
