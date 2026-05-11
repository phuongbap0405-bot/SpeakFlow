import 'package:freezed_annotation/freezed_annotation.dart';

import 'grammar_correction.dart';

part 'turn.freezed.dart';
part 'turn.g.dart';

@freezed
abstract class Turn with _$Turn {
  const Turn._();

  const factory Turn({
    required String id,
    required String transcription,
    required String aiResponse,
    required List<GrammarCorrection> grammarCorrections,
    /// Recording duration stored as milliseconds for JSON serialisation.
    required int recordingDurationMs,
    required DateTime timestamp,
  }) = _Turn;

  factory Turn.fromJson(Map<String, dynamic> json) => _$TurnFromJson(json);

  /// Convenience getter that exposes the duration as a [Duration] object.
  Duration get recordingDuration =>
      Duration(milliseconds: recordingDurationMs);
}
