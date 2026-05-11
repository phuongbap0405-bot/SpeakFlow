import 'package:json_annotation/json_annotation.dart';

part 'gpt_response_dto.g.dart';

/// DTO for the top-level OpenAI chat completions response.
///
/// Maps to the JSON shape:
/// ```json
/// {
///   "choices": [
///     { "message": { "content": "..." } }
///   ]
/// }
/// ```
@JsonSerializable()
class GptResponseDto {
  const GptResponseDto({required this.choices});

  final List<GptChoiceDto> choices;

  factory GptResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GptResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GptResponseDtoToJson(this);
}

/// DTO for a single choice in the OpenAI chat completions response.
@JsonSerializable()
class GptChoiceDto {
  const GptChoiceDto({required this.message});

  final GptMessageDto message;

  factory GptChoiceDto.fromJson(Map<String, dynamic> json) =>
      _$GptChoiceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GptChoiceDtoToJson(this);
}

/// DTO for the message object inside a choice.
@JsonSerializable()
class GptMessageDto {
  const GptMessageDto({required this.content});

  final String content;

  factory GptMessageDto.fromJson(Map<String, dynamic> json) =>
      _$GptMessageDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GptMessageDtoToJson(this);
}
