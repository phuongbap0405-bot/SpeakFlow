import 'package:freezed_annotation/freezed_annotation.dart';

import 'grammar_correction.dart';

part 'llm_response.freezed.dart';

/// LlmResponse is not persisted to JSON, so no fromJson factory is needed.
@freezed
abstract class LlmResponse with _$LlmResponse {
  const factory LlmResponse({
    required String responseText,
    required List<GrammarCorrection> grammarCorrections,
  }) = _LlmResponse;
}
