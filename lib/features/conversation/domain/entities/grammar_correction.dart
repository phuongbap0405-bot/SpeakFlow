import 'package:freezed_annotation/freezed_annotation.dart';

part 'grammar_correction.freezed.dart';
part 'grammar_correction.g.dart';

@freezed
abstract class GrammarCorrection with _$GrammarCorrection {
  const factory GrammarCorrection({
    required String originalPhrase,
    required String suggestedCorrection,
    required String explanation,
  }) = _GrammarCorrection;

  factory GrammarCorrection.fromJson(Map<String, dynamic> json) =>
      _$GrammarCorrectionFromJson(json);
}
