// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'turn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Turn _$TurnFromJson(Map<String, dynamic> json) => _Turn(
  id: json['id'] as String,
  transcription: json['transcription'] as String,
  aiResponse: json['aiResponse'] as String,
  grammarCorrections: (json['grammarCorrections'] as List<dynamic>)
      .map((e) => GrammarCorrection.fromJson(e as Map<String, dynamic>))
      .toList(),
  recordingDurationMs: (json['recordingDurationMs'] as num).toInt(),
  timestamp: DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$TurnToJson(_Turn instance) => <String, dynamic>{
  'id': instance.id,
  'transcription': instance.transcription,
  'aiResponse': instance.aiResponse,
  'grammarCorrections': instance.grammarCorrections,
  'recordingDurationMs': instance.recordingDurationMs,
  'timestamp': instance.timestamp.toIso8601String(),
};
