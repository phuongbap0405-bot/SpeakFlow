abstract class TtsService {
  Future<void> synthesizeAndPlay(String text);
  Future<void> replayLast();
}
