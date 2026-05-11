import 'package:injectable/injectable.dart';

import '../../domain/services/stt_service.dart';

/// Mock implementation of [SttService] for offline testing.
@Environment('mock')
@Injectable(as: SttService)
class MockSttService implements SttService {
  @override
  Future<String> transcribe(String audioFilePath) async {
    // Simulate processing delay
    await Future.delayed(const Duration(milliseconds: 800));

    return "This is a mock transcription of your voice message.";
  }
}
