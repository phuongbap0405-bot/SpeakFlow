import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Injectable module that provides a pre-configured [Dio] singleton.
///
/// The instance has no fixed base URL — each service passes the full URL
/// directly. This works for both the Gemini API (free tier) and any future
/// provider.
///
/// Timeouts are set generously to accommodate audio transcription requests.
@module
abstract class NetworkModule {
  @singleton
  Dio get dio {
    final options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 120),
      sendTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    return Dio(options);
  }
}
