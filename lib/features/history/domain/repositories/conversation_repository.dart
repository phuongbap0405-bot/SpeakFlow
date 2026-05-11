import '../entities/session.dart';

abstract class ConversationRepository {
  Future<void> saveSession(Session session);
  Future<List<Session>> getAllSessions();
  Future<Session?> getSessionById(String id);
}
