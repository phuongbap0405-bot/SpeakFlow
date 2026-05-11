import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../services/tts_service.dart';

/// Delegates to [TtsService] to synthesize and play the AI response text.
///
/// Returns [Left(TtsFailure)] on any error, otherwise [Right(unit)].
@injectable
class SynthesizeSpeechUseCase {
  final TtsService _ttsService;

  SynthesizeSpeechUseCase(this._ttsService);

  Future<Either<Failure, Unit>> call({required String text}) async {
    try {
      await _ttsService.synthesizeAndPlay(text);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.ttsError(e.toString()));
    }
  }
}
