import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// The OpenAI API base URL used for all requests.
const String _openAiBaseUrl = 'https://api.openai.com/v1';

/// API key read from the `OPENAI_API_KEY` compile-time environment variable.
/// Pass it at build time with:
///   flutter run --dart-define=OPENAI_API_KEY=sk-...
const String _apiKey = String.fromEnvironment('OPENAI_API_KEY');

/// Injectable module that provides a pre-configured [Dio] singleton.
///
/// The instance is set up with:
/// - Base URL pointing to the OpenAI v1 API
/// - `Authorization: Bearer <key>` header injected on every request
/// - Sensible connect / receive / send timeouts
@module
abstract class NetworkModule {
  /// Returns a [Dio] instance configured for the OpenAI API.
  @singleton
  Dio get dio {
    final options = BaseOptions(
      baseUrl: _openAiBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: {
        'Authorization': 'Bearer $_apiKey',
        'Content-Type': 'application/json',
      },
    );

    return Dio(options);
  }
}
