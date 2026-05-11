import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../services/stt_service.dart';

/// Delegates audio transcription to [SttService] and returns the result.
///
/// Returns [Left(SttFailure)] on any error, otherwise [Right(String)] with
/// the transcription text.
@injectable
class TranscribeAudioUseCase {
  final SttService _sttService;

  TranscribeAudioUseCase(this._sttService);

  Future<Either<Failure, String>> call({required String audioFilePath}) async {
    try {
      final transcription = await _sttService.transcribe(audioFilePath);
      return Right(transcription);
    } catch (e) {
      return Left(Failure.sttError(e.toString()));
    }
  }
}
