import 'package:json_annotation/json_annotation.dart';

part 'whisper_response_dto.g.dart';

/// DTO for the response returned by the OpenAI Whisper transcription endpoint.
///
/// Example response:
/// ```json
/// { "text": "Hello, how are you?" }
/// ```
@JsonSerializable()
class WhisperResponseDto {
  final String text;

  const WhisperResponseDto({required this.text});

  factory WhisperResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WhisperResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WhisperResponseDtoToJson(this);
}
