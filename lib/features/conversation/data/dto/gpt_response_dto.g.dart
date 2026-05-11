// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GptResponseDto _$GptResponseDtoFromJson(Map<String, dynamic> json) =>
    GptResponseDto(
      choices: (json['choices'] as List<dynamic>)
          .map((e) => GptChoiceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GptResponseDtoToJson(GptResponseDto instance) =>
    <String, dynamic>{'choices': instance.choices};

GptChoiceDto _$GptChoiceDtoFromJson(Map<String, dynamic> json) => GptChoiceDto(
  message: GptMessageDto.fromJson(json['message'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GptChoiceDtoToJson(GptChoiceDto instance) =>
    <String, dynamic>{'message': instance.message};

GptMessageDto _$GptMessageDtoFromJson(Map<String, dynamic> json) =>
    GptMessageDto(content: json['content'] as String);

Map<String, dynamic> _$GptMessageDtoToJson(GptMessageDto instance) =>
    <String, dynamic>{'content': instance.content};
