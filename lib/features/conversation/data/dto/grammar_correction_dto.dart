import 'package:json_annotation/json_annotation.dart';

part 'grammar_correction_dto.g.dart';

/// Data Transfer Object for a single grammar correction returned by GPT-4o.
///
/// Maps to the JSON shape:
/// ```json
/// {
///   "originalPhrase": "...",
///   "suggestedCorrection": "...",
///   "explanation": "..."
/// }
/// ```
@JsonSerializable()
class GrammarCorrectionDto {
  const GrammarCorrectionDto({
    required this.originalPhrase,
    required this.suggestedCorrection,
    required this.explanation,
  });

  final String originalPhrase;
  final String suggestedCorrection;
  final String explanation;

  factory GrammarCorrectionDto.fromJson(Map<String, dynamic> json) =>
      _$GrammarCorrectionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GrammarCorrectionDtoToJson(this);
}
