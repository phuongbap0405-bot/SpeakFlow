// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grammar_correction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GrammarCorrection _$GrammarCorrectionFromJson(Map<String, dynamic> json) =>
    _GrammarCorrection(
      originalPhrase: json['originalPhrase'] as String,
      suggestedCorrection: json['suggestedCorrection'] as String,
      explanation: json['explanation'] as String,
    );

Map<String, dynamic> _$GrammarCorrectionToJson(_GrammarCorrection instance) =>
    <String, dynamic>{
      'originalPhrase': instance.originalPhrase,
      'suggestedCorrection': instance.suggestedCorrection,
      'explanation': instance.explanation,
    };
