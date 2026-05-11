// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar_correction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrammarCorrectionDto _$GrammarCorrectionDtoFromJson(
  Map<String, dynamic> json,
) => GrammarCorrectionDto(
  originalPhrase: json['originalPhrase'] as String,
  suggestedCorrection: json['suggestedCorrection'] as String,
  explanation: json['explanation'] as String,
);

Map<String, dynamic> _$GrammarCorrectionDtoToJson(
  GrammarCorrectionDto instance,
) => <String, dynamic>{
  'originalPhrase': instance.originalPhrase,
  'suggestedCorrection': instance.suggestedCorrection,
  'explanation': instance.explanation,
};
