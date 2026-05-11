# Implementation Plan: SpeakFlow

## Overview

Implement SpeakFlow as a Flutter application following Clean Architecture (presentation → domain ← data), feature-first directory structure, Bloc state management, and provider-swappable AI service abstractions. The MVP uses OpenAI Whisper (STT), GPT-4o (LLM), and OpenAI TTS behind domain-layer interfaces.

---

## Tasks

- [x] 1. Set up project foundation and core infrastructure
  - [x] 1.1 Initialize Flutter project and configure pubspec.yaml dependencies
    - Add all required packages: `flutter_bloc`, `freezed`, `json_serializable`, `get_it`, `injectable`, `dio`, `shared_preferences`, `dartz`, `record`, `just_audio`, `uuid`, `path_provider`
    - Add dev dependencies: `build_runner`, `freezed_annotation`, `injectable_generator`, `json_annotation`
    - Create the feature-first directory structure under `lib/` as defined in the design
    - _Requirements: 10.1, 10.4, 10.5, 10.7_

  - [x] 1.2 Implement core error types and Failure sealed class
    - Create `lib/core/error/failures.dart` with the `Failure` sealed class using freezed: `SttFailure`, `LlmFailure`, `TtsFailure`, `AudioRecordingFailure`, `StorageFailure`, `PermissionDeniedFailure`, `NetworkFailure`
    - Create `lib/core/error/exceptions.dart` for data-layer exceptions
    - _Requirements: 10.1, 10.2_

  - [x] 1.3 Configure Dio client factory and DI container
    - Create `lib/core/network/dio_client.dart` with OpenAI base URL and Authorization header injection
    - Create `lib/core/di/injection.dart` with `@InjectableInit` setup and `configureDependencies()` function
    - Register `Dio` as a singleton and `SharedPreferences` via async factory
    - _Requirements: 9.4, 10.4_

  - [x] 1.4 Create core utility helpers
    - Create `lib/core/utils/date_utils.dart` with `dateOnly()` helper for streak calculation
    - Create `lib/core/utils/duration_formatter.dart` with `formatAsHoursMinutes(int seconds)` returning `H:MM` format
    - _Requirements: 8.4, 8.5_

- [x] 2. Implement domain layer entities and interfaces
  - [x] 2.1 Define domain entities with freezed
    - Create `GrammarCorrection`, `Turn`, `Session`, `ProgressStats`, and `LlmResponse` entities in their respective feature domain directories
    - Run `build_runner` to generate `.freezed.dart` and `.g.dart` files
    - _Requirements: 10.5_

  - [x] 2.2 Define service and repository interfaces
    - Create `SttService`, `LlmService`, `TtsService`, and `AudioRecorder` abstract classes in `features/conversation/domain/`
    - Create `ConversationRepository` abstract class in `features/history/domain/`
    - Create `ProgressRepository` abstract class in `features/progress/domain/`
    - Ensure no Flutter framework or external package imports in domain layer
    - _Requirements: 3.6, 4.6, 5.6, 7.4, 8.6, 9.1, 10.2_

  - [x] 2.3 Implement all Use Cases
    - Create `StartSessionUseCase`, `TranscribeAudioUseCase`, `GenerateTurnResponseUseCase`, `SynthesizeSpeechUseCase`, `EndSessionUseCase` in `features/conversation/domain/`
    - Create `GetSessionsUseCase`, `GetSessionDetailUseCase` in `features/history/domain/`
    - Create `GetProgressStatsUseCase`, `UpdateProgressStatsUseCase` in `features/progress/domain/`
    - Each use case has a single `call()` method returning `Either<Failure, T>`
    - _Requirements: 10.6_

  - [ ]* 2.4 Write property test for custom topic length validation
    - **Property 1: Custom topic length validation**
    - **Validates: Requirements 1.3, 1.5**
    - Test that `StartSessionUseCase` or topic validation logic accepts strings of length 1–200 and rejects length 0 or >200

  - [ ]* 2.5 Write property test for valid topic enables session start
    - **Property 2: Valid topic enables session start**
    - **Validates: Requirements 1.4, 1.6**
    - Test that any non-empty topic (1–200 chars) produces a Session whose `topic` field equals the input string

  - [ ]* 2.6 Write property test for LLM response structure
    - **Property 5: LLM response includes grammar corrections**
    - **Validates: Requirements 4.1, 6.1**
    - Test that `LlmResponse` always contains both a non-empty `responseText` and a `grammarCorrections` list (may be empty)

  - [ ]* 2.7 Write property test for conversation history passed to LLM
    - **Property 6: Conversation history passed to LLM**
    - **Validates: Requirements 4.2**
    - Test that for a session with N turns, `GenerateTurnResponseUseCase` passes all N prior turns in chronological order to the LLM service

- [x] 3. Implement data layer — AI service implementations
  - [x] 3.1 Implement OpenAI STT service
    - Create `OpenAiSttService` in `features/conversation/data/` implementing `SttService`
    - POST multipart/form-data to `https://api.openai.com/v1/audio/transcriptions` with `model: whisper-1`
    - Create `WhisperResponseDto` with `json_serializable`
    - Annotate with `@Injectable(as: SttService)`
    - _Requirements: 9.2, 9.4_

  - [x] 3.2 Implement OpenAI LLM service
    - Create `OpenAiLlmService` in `features/conversation/data/` implementing `LlmService`
    - POST to `https://api.openai.com/v1/chat/completions` with `model: gpt-4o`
    - Build system prompt with topic and structured JSON response format (see design)
    - Include full conversation history as message array
    - Create `GptResponseDto` and `GrammarCorrectionDto` with `json_serializable`
    - Parse JSON response into `LlmResponse` with `responseText` and `grammarCorrections`
    - Annotate with `@Injectable(as: LlmService)`
    - _Requirements: 4.1, 4.2, 6.1, 9.2, 9.4_

  - [x] 3.3 Implement OpenAI TTS service
    - Create `OpenAiTtsService` in `features/conversation/data/` implementing `TtsService`
    - POST to `https://api.openai.com/v1/audio/speech` with `model: tts-1, voice: alloy`
    - Save audio bytes to a temp file and play via `just_audio`
    - Implement `replayLast()` by caching the last audio file path
    - Annotate with `@Injectable(as: TtsService)`
    - _Requirements: 5.1, 5.4, 9.2, 9.4_

  - [x] 3.4 Implement AudioRecorder
    - Create `AudioRecorderImpl` in `features/conversation/data/` implementing `AudioRecorder`
    - Use `record` package for microphone capture
    - Implement `requestPermission()`, `startRecording()`, `stopRecording()` returning audio file path
    - Expose `elapsedTime` as a `Stream<Duration>` updated every second
    - Enforce 120-second max duration with auto-stop
    - Annotate with `@Injectable(as: AudioRecorder)`
    - _Requirements: 2.1, 2.3, 2.4, 2.5, 2.6, 2.7_

  - [ ]* 3.5 Write property test for recording duration enforcement
    - **Property 3: Recording duration enforcement**
    - **Validates: Requirements 2.6, 2.7**
    - Test that `AudioRecorderImpl` never produces an audio file with duration > 120 seconds

- [x] 4. Implement data layer — storage implementations
  - [x] 4.1 Implement ConversationRepository with shared_preferences
    - Create `SharedPrefsConversationRepository` in `features/history/data/` implementing `ConversationRepository`
    - Serialize/deserialize `Session` list to JSON using `json_serializable`; key: `speakflow_sessions`
    - Implement `saveSession`, `getAllSessions` (sorted reverse chronological), `getSessionById`
    - Annotate with `@Injectable(as: ConversationRepository)`
    - _Requirements: 7.1, 7.2, 7.3, 7.5, 7.6_

  - [x] 4.2 Implement ProgressRepository with shared_preferences
    - Create `SharedPrefsProgressRepository` in `features/progress/data/` implementing `ProgressRepository`
    - Serialize/deserialize `ProgressStats` to JSON; key: `speakflow_progress`
    - Store `lastSessionDate` as ISO-8601 date string alongside stats
    - Annotate with `@Injectable(as: ProgressRepository)`
    - _Requirements: 8.1, 8.6_

  - [ ]* 4.3 Write property test for session persistence round-trip
    - **Property 13: Session persistence round-trip**
    - **Validates: Requirements 7.1, 7.3**
    - Test that saving any Session and retrieving it by ID returns a structurally equal Session

  - [ ]* 4.4 Write property test for history reverse chronological order
    - **Property 14: History ordered reverse chronologically**
    - **Validates: Requirements 7.2**
    - Test that `getAllSessions` always returns sessions sorted by `startTime` descending

  - [ ]* 4.5 Write property test for progress stats non-negativity
    - **Property 15: Progress stats non-negativity invariant**
    - **Validates: Requirements 8.1**
    - Test that no sequence of updates produces negative values in any `ProgressStats` field

  - [ ]* 4.6 Write property test for sessions counter increment
    - **Property 16: Sessions counter increments by one**
    - **Validates: Requirements 8.2**
    - Test that completing a session always increments `sessionsCompleted` by exactly 1

  - [ ]* 4.7 Write property test for speaking time accumulation
    - **Property 17: Speaking time accumulates correctly**
    - **Validates: Requirements 8.3**
    - Test that the sum of all turn `recordingDuration` values is added to `totalSpeakingTimeSeconds`

  - [ ]* 4.8 Write property test for streak calculation
    - **Property 18: Streak calculation correctness**
    - **Validates: Requirements 8.4**
    - Test all four streak cases: same day (unchanged), next day (+1), gap > 1 day (reset to 1), always ≥ 1

- [x] 5. Checkpoint — Ensure all tests pass
  - Ensure all tests pass, ask the user if questions arise.

- [x] 6. Implement topic selection feature
  - [x] 6.1 Build TopicBloc with events and states
    - Create sealed event classes: `TopicSelected`, `CustomTopicChanged`, `SessionStartRequested` using freezed
    - Create sealed state classes: `TopicInitial`, `TopicValid`, `TopicInvalid`, `SessionStarting`, `SessionStarted` using freezed
    - Implement bloc logic: validate custom topic length (1–200 chars), enable/disable start action, call `StartSessionUseCase`
    - _Requirements: 1.3, 1.4, 1.5, 1.6, 10.3_

  - [x] 6.2 Build TopicPage and widgets
    - Create `TopicPage` with `BlocProvider<TopicBloc>`
    - Create `TopicListTile` widget for predefined topics (Job Interviews, Daily Life, Tech Discussions)
    - Create `CustomTopicField` with 200-char limit, inline validation message on empty submit
    - Wire "Start Session" button to `SessionStartRequested` event; disable when state is `TopicInvalid` or `TopicInitial`
    - Navigate to `ConversationPage` on `SessionStarted` state
    - _Requirements: 1.1, 1.2, 1.3, 1.4, 1.5, 1.6_

  - [ ]* 6.3 Write unit tests for TopicBloc
    - Test that empty custom topic emits `TopicInvalid`
    - Test that valid custom topic (1–200 chars) emits `TopicValid`
    - Test that custom topic > 200 chars emits `TopicInvalid`
    - Test that predefined topic selection emits `TopicValid`
    - _Requirements: 1.3, 1.4, 1.5_

- [x] 7. Implement conversation feature
  - [x] 7.1 Build ConversationBloc with events and states
    - Create sealed event and state classes using freezed (see design for full list)
    - Implement the full turn flow: `RecordingStarted` → `RecordingStopped` → `TranscriptionRequested` → `ResponseRequested` → `TtsCompleted`
    - Handle `ConversationError` state with `retryAction` callback for STT, LLM, and TTS failures
    - Handle `CorrectionsOpened` / `CorrectionsDismissed` without mutating turn list
    - Handle `SessionEnded` by calling `EndSessionUseCase`
    - _Requirements: 2.3, 2.4, 2.5, 3.2, 3.3, 3.4, 4.3, 4.4, 5.2, 5.3, 5.5, 6.4, 6.6, 10.3_

  - [x] 7.2 Build ConversationPage and core widgets
    - Create `ConversationPage` with scrollable list of `ConversationBubble` widgets
    - Create `ConversationBubble` showing user or AI message; show `InlineIndicator` on user bubble when `grammarCorrections` is non-empty
    - Create `InlineIndicator` tappable icon/badge that dispatches `CorrectionsOpened`
    - Create `CorrectionsPanel` bottom sheet listing each `GrammarCorrection` with `originalPhrase`, `suggestedCorrection`, and `explanation`
    - Create `RecordButton` FAB: disabled during TTS playback and AI processing, enabled after TTS completes
    - Create `RecordingTimer` displaying elapsed time updated every second
    - Create `PlaybackIndicator` animated icon on AI bubble during TTS playback
    - Add replay button for most recent TTS audio
    - _Requirements: 2.4, 3.5, 4.5, 5.2, 5.3, 5.4, 6.2, 6.3, 6.4, 6.5, 6.6_

  - [x] 7.3 Implement microphone permission flow
    - On first recording attempt, call `AudioRecorder.requestPermission()`
    - If `PermissionDeniedFailure`, show explanatory message and prompt to open device settings
    - _Requirements: 2.1, 2.2_

  - [ ]* 7.4 Write property test for transcription displayed in conversation
    - **Property 4: Transcription displayed in conversation**
    - **Validates: Requirements 3.5**
    - Test that any successful STT result string appears as the user bubble text in `ConversationBloc` state

  - [ ]* 7.5 Write property test for AI response displayed in conversation
    - **Property 7: AI response displayed in conversation**
    - **Validates: Requirements 4.5**
    - Test that any `LlmResponse.responseText` appears as the AI Tutor bubble text in `ConversationBloc` state

  - [ ]* 7.6 Write property test for TTS triggers on AI response
    - **Property 8: TTS triggers on AI response availability**
    - **Validates: Requirements 5.1**
    - Test that `SynthesizeSpeechUseCase` is called with the exact `responseText` for any generated LLM response

  - [ ]* 7.7 Write property test for record button enabled after TTS
    - **Property 9: Record button enabled after TTS completes**
    - **Validates: Requirements 5.3, 5.5**
    - Test that `TtsCompleted` and `TtsErrorOccurred` events both transition `ConversationBloc` to a state where the record button is enabled

  - [ ]* 7.8 Write property test for inline indicator presence
    - **Property 10: Inline indicator presence matches corrections**
    - **Validates: Requirements 6.2, 6.3**
    - Test that for any turn, `InlineIndicator` is shown iff `grammarCorrections` is non-empty

  - [ ]* 7.9 Write property test for corrections panel content
    - **Property 11: Corrections panel displays all correction fields**
    - **Validates: Requirements 6.5**
    - Test that for any turn with corrections, the panel renders all three fields for every correction

  - [ ]* 7.10 Write property test for corrections panel dismissal
    - **Property 12: Corrections panel dismissal preserves conversation state**
    - **Validates: Requirements 6.6**
    - Test that `CorrectionsOpened` followed by `CorrectionsDismissed` leaves the turn list and session topic unchanged in `ConversationBloc` state

- [x] 8. Checkpoint — Ensure all tests pass
  - Ensure all tests pass, ask the user if questions arise.

- [x] 9. Implement history feature
  - [x] 9.1 Build HistoryBloc and HistoryPage
    - Create sealed event/state classes: `HistoryLoaded`, `SessionSelected` / `HistoryLoading`, `HistoryLoaded(sessions)`, `SessionDetailLoaded(session)`, `HistoryError`
    - Implement `HistoryPage` listing all past sessions in reverse chronological order with topic and date
    - Implement `SessionDetailPage` showing full turn-by-turn conversation in read-only mode
    - Wire `SessionSelected` to call `GetSessionDetailUseCase` and navigate to `SessionDetailPage`
    - _Requirements: 7.2, 7.3, 10.3_

- [x] 10. Implement progress tracking feature
  - [x] 10.1 Build ProgressBloc and ProgressPage
    - Create sealed event/state classes: `StatsLoaded` / `ProgressLoading`, `ProgressLoaded(stats)`, `ProgressError`
    - Implement `ProgressPage` with `ProgressCard` showing sessions completed, total speaking time as `H:MM`, and streak in days
    - Wire `StatsLoaded` event to call `GetProgressStatsUseCase`
    - _Requirements: 8.1, 8.5, 10.3_

  - [x] 10.2 Implement UpdateProgressStatsUseCase logic
    - In `EndSessionUseCase`, after persisting the session, call `UpdateProgressStatsUseCase`
    - Increment `sessionsCompleted` by 1
    - Add sum of all turn `recordingDuration` values (in seconds) to `totalSpeakingTimeSeconds`
    - Apply streak calculation logic from design: same day → unchanged, next day → +1, gap > 1 → reset to 1
    - _Requirements: 8.2, 8.3, 8.4_

  - [ ]* 10.3 Write property test for progress stats display formatting
    - **Property 19: Progress stats display formatting**
    - **Validates: Requirements 8.5**
    - Test that `formatAsHoursMinutes(seconds)` satisfies `hours * 3600 + minutes * 60 <= seconds < hours * 3600 + (minutes + 1) * 60` for any non-negative integer input

- [x] 11. Wire navigation and app entry point
  - [x] 11.1 Set up app router and bottom navigation
    - Create `MaterialApp` in `main.dart` with named routes for `TopicPage`, `ConversationPage`, `HistoryPage`, `ProgressPage`
    - Add bottom navigation bar with tabs for History and Progress
    - Call `configureDependencies()` before `runApp`
    - _Requirements: 1.1, 7.2, 8.5_

  - [x] 11.2 Run build_runner to generate all code
    - Run `flutter pub run build_runner build --delete-conflicting-outputs`
    - Verify all `.freezed.dart`, `.g.dart`, and `injection.config.dart` files are generated without errors
    - _Requirements: 10.3, 10.5_

- [x] 12. Final checkpoint — Ensure all tests pass
  - Ensure all tests pass, ask the user if questions arise.

---

## Notes

- Tasks marked with `*` are optional and can be skipped for faster MVP delivery
- Each task references specific requirements for traceability
- Checkpoints at tasks 5, 8, and 12 ensure incremental validation
- Property tests validate universal correctness properties defined in the design document
- Unit tests validate specific examples and edge cases
- The domain layer must never import Flutter framework packages, `dio`, or `shared_preferences`
- Provider swapping (e.g., replacing OpenAI with another provider) requires only creating a new data-layer class and updating the `@Injectable` annotation — no domain or presentation changes needed

## Task Dependency Graph

```json
{
  "waves": [
    { "id": 0, "tasks": ["1.1"] },
    { "id": 1, "tasks": ["1.2", "1.3", "1.4"] },
    { "id": 2, "tasks": ["2.1", "2.2"] },
    { "id": 3, "tasks": ["2.3"] },
    { "id": 4, "tasks": ["2.4", "2.5", "2.6", "2.7", "3.1", "3.2", "3.3", "3.4", "4.1", "4.2"] },
    { "id": 5, "tasks": ["3.5", "4.3", "4.4", "4.5", "4.6", "4.7", "4.8", "6.1", "9.1", "10.1", "10.2"] },
    { "id": 6, "tasks": ["6.2", "6.3", "7.1"] },
    { "id": 7, "tasks": ["7.2", "7.3", "10.3"] },
    { "id": 8, "tasks": ["7.4", "7.5", "7.6", "7.7", "7.8", "7.9", "7.10"] },
    { "id": 9, "tasks": ["11.1"] },
    { "id": 10, "tasks": ["11.2"] }
  ]
}
```
