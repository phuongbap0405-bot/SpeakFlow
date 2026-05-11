import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../conversation/domain/entities/turn.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
abstract class Session with _$Session {
  const factory Session({
    required String id,
    required String topic,
    required DateTime startTime,
    required DateTime endTime,
    required List<Turn> turns,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
