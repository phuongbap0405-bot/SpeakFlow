# Design Document

## Overview

SpeakFlow is a Flutter application for practicing spoken English with an AI tutor. It follows Clean Architecture with a feature-first directory structure, Bloc state management, and provider-swappable AI service abstractions. The MVP uses OpenAI Whisper (STT), GPT-4o (LLM), and OpenAI TTS, all behind domain-layer interfaces.

---

## Architecture

### Layer Structure

```
presentation/   ← Bloc, Widgets, Pages
      ↓
domain/         ← Entities, Use Cases, Repository Interfaces, Service Interfaces
      ↑
data/           ← Repository Implementations, Service Implementations, DTOs, Local Storage
```

Dependencies point inward: presentation and data both depend on domain; domain depends on nothing external.

### Feature-First Directory Structure

```
lib/
├── core/
│   ├── di/                        # get_it + injectable setup
│   ├── error/                     # Failure types, exceptions
│   ├── network/                   # Dio client factory
│   └── utils/                     # Date helpers, formatters
├── features/
│   ├── topic_selection/
│   │   ├── presentation/          # TopicBloc, TopicPage, widgets
│   │   ├── domain/                # Topic entity, StartSessionUseCase
│   │   └── data/                  # PredefinedTopicsRepository impl
│   ├── conversation/
│   │   ├── presentation/          # ConversationBloc, ConversationPage, widgets
│   │   ├── domain/                # Turn entity, use cases (RecordTurn, Transcribe, GenerateResponse, SynthesizeSpeech, AnalyzeGrammar)
│   │   └── data/                  # STT/LLM/TTS implementations, AudioRecorderImpl
│   ├── history/
│   │   ├── presentation/          # HistoryBloc, HistoryPage, SessionDetailPage
│   │   ├── domain/                # Session entity, GetSessionsUseCase, GetSessionDetailUseCase
│   │   └── data/                  # ConversationRepositoryImpl (shared_preferences)
│   └── progress/
│       ├── presentation/          # ProgressBloc, ProgressPage
│       ├── domain/                # ProgressStats entity, GetProgressUseCase, UpdateProgressUseCase
│       └── data/                  # ProgressRepositoryImpl (shared_preferences)
└── main.dart
```

---

## Components

### Domain Layer

#### Entities

```dart
// Session entity
@freezed
class Session with _$Session {
  const factory Session({
    required String id,
    required String topic,
    required DateTime startTime,
    required DateTime endTime,
    required List<Turn> turns,
  }) = _Session;
}

// Turn entity
@freezed
class Turn with _$Turn {
  const factory Turn({
    required String id,
    required String transcription,
    required String aiResponse,
    required List<GrammarCorrection> grammarCorrections,
    required Duration recordingDuration,
    required DateTime timestamp,
  }) = _Turn;
}

// GrammarCorrection entity
@freezed
class GrammarCorrection with _$GrammarCorrection {
  const factory GrammarCorrection({
    required String originalPhrase,
    required String suggestedCorrection,
    required String explanation,
  }) = _GrammarCorrection;
}

// ProgressStats entity
@freezed
class ProgressStats with _$ProgressStats {
  const factory ProgressStats({
    required int sessionsCompleted,
    required int totalSpeakingTimeSeconds,
    required int currentStreakDays,
  }) = _ProgressStats;
}
```

#### Service Interfaces (domain layer — no external imports)

```dart
abstract class SttService {
  Future<String> transcribe(String audioFilePath);
}

abstract class LlmService {
  Future<LlmResponse> generateResponse({
    required String topic,
    required String userMessage,
    required List<Turn> conversationHistory,
  });
}

// LlmResponse bundles the conversational reply and grammar corrections
@freezed
class LlmResponse with _$LlmResponse {
  const factory LlmResponse({
    required String responseText,
    required List<GrammarCorrection> grammarCorrections,
  }) = _LlmResponse;
}

abstract class TtsService {
  Future<void> synthesizeAndPlay(String text);
  Future<void> replayLast();
}

abstract class AudioRecorder {
  Future<void> requestPermission();
  Future<void> startRecording();
  Future<String> stopRecording(); // returns audio file path
  Stream<Duration> get elapsedTime;
  static const maxDuration = Duration(seconds: 120);
}
```

#### Repository Interfaces (domain layer)

```dart
abstract class ConversationRepository {
  Future<void> saveSession(Session session);
  Future<List<Session>> getAllSessions();
  Future<Session?> getSessionById(String id);
}

abstract class ProgressRepository {
  Future<ProgressStats> getStats();
  Future<void> saveStats(ProgressStats stats);
}
```

#### Use Cases

Each use case has a single public `call()` method and a single responsibility:

| Use Case | Responsibility |
|---|---|
| `StartSessionUseCase` | Creates a new Session with a given topic |
| `TranscribeAudioUseCase` | Delegates to SttService, returns transcription string |
| `GenerateTurnResponseUseCase` | Delegates to LlmService with history context, returns LlmResponse |
| `SynthesizeSpeechUseCase` | Delegates to TtsService to play AI response |
| `EndSessionUseCase` | Persists session via ConversationRepository, updates ProgressStats |
| `GetSessionsUseCase` | Returns all sessions in reverse chronological order |
| `GetSessionDetailUseCase` | Returns a single session by ID |
| `GetProgressStatsUseCase` | Returns current ProgressStats |
| `UpdateProgressStatsUseCase` | Recalculates and persists stats after a session ends |

---

### Data Layer

#### OpenAI Service Implementations

```dart
@Injectable(as: SttService)
class OpenAiSttService implements SttService {
  final Dio _dio;
  // POST multipart/form-data to https://api.openai.com/v1/audio/transcriptions
  // model: whisper-1
  @override
  Future<String> transcribe(String audioFilePath) async { ... }
}

@Injectable(as: LlmService)
class OpenAiLlmService implements LlmService {
  final Dio _dio;
  // POST to https://api.openai.com/v1/chat/completions
  // model: gpt-4o
  // System prompt instructs: respond conversationally + return grammar corrections as JSON
  @override
  Future<LlmResponse> generateResponse({...}) async { ... }
}

@Injectable(as: TtsService)
class OpenAiTtsService implements TtsService {
  final Dio _dio;
  // POST to https://api.openai.com/v1/audio/speech
  // model: tts-1, voice: alloy
  @override
  Future<void> synthesizeAndPlay(String text) async { ... }
}
```

#### Repository Implementations

```dart
@Injectable(as: ConversationRepository)
class SharedPrefsConversationRepository implements ConversationRepository {
  final SharedPreferences _prefs;
  // Serializes Session list to JSON via json_serializable
  // Key: 'speakflow_sessions'
}

@Injectable(as: ProgressRepository)
class SharedPrefsProgressRepository implements ProgressRepository {
  final SharedPreferences _prefs;
  // Serializes ProgressStats to JSON
  // Key: 'speakflow_progress'
}
```

#### DTOs

All network response models are separate DTO classes in the data layer, mapped to domain entities:

```dart
@JsonSerializable()
class WhisperResponseDto { final String text; }

@JsonSerializable()
class GptResponseDto { /* choices, message content */ }

@JsonSerializable()
class GrammarCorrectionDto {
  final String originalPhrase;
  final String suggestedCorrection;
  final String explanation;
}
```

---

### Presentation Layer

#### Blocs

**TopicBloc**
- Events: `TopicSelected(Topic)`, `CustomTopicChanged(String)`, `SessionStartRequested`
- States: `TopicInitial`, `TopicValid(topic)`, `TopicInvalid(error)`, `SessionStarting`, `SessionStarted(Session)`

**ConversationBloc**
- Events: `RecordingStarted`, `RecordingStopped`, `TranscriptionRequested(audioPath)`, `ResponseRequested(transcription)`, `TtsCompleted`, `TtsErrorOccurred`, `CorrectionsOpened(turnId)`, `CorrectionsDismissed`, `SessionEnded`
- States: `ConversationIdle`, `Recording(elapsed)`, `Transcribing`, `GeneratingResponse`, `PlayingTts(turnId)`, `AwaitingNextTurn(turns)`, `CorrectionsOpen(turn)`, `ConversationError(message, retryAction)`, `SessionComplete`

**HistoryBloc**
- Events: `HistoryLoaded`, `SessionSelected(id)`
- States: `HistoryLoading`, `HistoryLoaded(sessions)`, `SessionDetailLoaded(session)`, `HistoryError`

**ProgressBloc**
- Events: `StatsLoaded`
- States: `ProgressLoading`, `ProgressLoaded(stats)`, `ProgressError`

#### Key Widgets

- `TopicListTile` — renders a predefined topic with selection state
- `CustomTopicField` — text field with 200-char limit and inline validation
- `ConversationBubble` — renders a single turn message; shows `InlineIndicator` when corrections exist
- `InlineIndicator` — subtle icon/badge on user bubble; tappable to open CorrectionsPanel
- `CorrectionsPanel` — bottom sheet listing all GrammarCorrections for a turn
- `RecordButton` — animated FAB; disabled during TTS playback and AI processing
- `RecordingTimer` — displays elapsed recording time, updated every second
- `PlaybackIndicator` — animated icon on AI bubble during TTS playback
- `ProgressCard` — displays sessions, speaking time (h:mm), and streak

---

## Data Models

### Session JSON Schema (shared_preferences)

```json
{
  "id": "uuid-string",
  "topic": "Job Interviews",
  "startTime": "2024-01-15T10:00:00.000Z",
  "endTime": "2024-01-15T10:15:00.000Z",
  "turns": [
    {
      "id": "uuid-string",
      "transcription": "Tell me about yourself.",
      "aiResponse": "Sure! I'd be happy to help you practice...",
      "grammarCorrections": [
        {
          "originalPhrase": "Tell me about yourself",
          "suggestedCorrection": "Could you tell me about yourself?",
          "explanation": "Adding 'Could you' makes the request more polite."
        }
      ],
      "recordingDurationMs": 8500,
      "timestamp": "2024-01-15T10:01:00.000Z"
    }
  ]
}
```

### ProgressStats JSON Schema

```json
{
  "sessionsCompleted": 12,
  "totalSpeakingTimeSeconds": 3600,
  "currentStreakDays": 5,
  "lastSessionDate": "2024-01-15"
}
```

---

## Interfaces and Abstractions

### Dependency Injection Setup

```dart
// core/di/injection.dart
@InjectableInit()
void configureDependencies() => getIt.init();

// Dio is registered as a singleton with OpenAI base URL + auth header
// SharedPreferences is registered as a singleton via async factory
// All service and repository interfaces are bound to their implementations via @Injectable(as: Interface)
```

### Provider Swapping

To swap from OpenAI to another provider:
1. Create a new implementation class in `data/` implementing the relevant interface
2. Change the `@Injectable(as: SttService)` annotation (or use environment-based registration)
3. Run `flutter pub run build_runner build`
4. No domain or presentation code changes required

---

## Error Handling

All errors are modeled as `Failure` sealed classes in the domain layer:

```dart
@freezed
sealed class Failure with _$Failure {
  const factory Failure.sttError(String message) = SttFailure;
  const factory Failure.llmError(String message) = LlmFailure;
  const factory Failure.ttsError(String message) = TtsFailure;
  const factory Failure.audioRecordingError(String message) = AudioRecordingFailure;
  const factory Failure.storageError(String message) = StorageFailure;
  const factory Failure.permissionDenied() = PermissionDeniedFailure;
  const factory Failure.networkError(String message) = NetworkFailure;
}
```

Use cases return `Either<Failure, T>` (using `dartz` or a simple `Result` type). Blocs map failures to error states with a `retryAction` callback where retry is supported.

---

## LLM Prompt Design

The system prompt instructs GPT-4o to:
1. Act as a friendly English conversation tutor
2. Respond conversationally in English, relevant to the session topic
3. Return a structured JSON response with two fields: `response` (string) and `corrections` (array of `{originalPhrase, suggestedCorrection, explanation}`)

```
System: You are a friendly English conversation tutor. The topic is: {topic}.
Respond conversationally to the user's message. Also identify any grammar errors
in the user's message. Return your answer as JSON:
{
  "response": "<your conversational reply>",
  "corrections": [
    { "originalPhrase": "...", "suggestedCorrection": "...", "explanation": "..." }
  ]
}
If there are no grammar errors, return an empty array for corrections.
```

---

## Streak Calculation Logic

```dart
ProgressStats updateStreak(ProgressStats current, DateTime sessionDate, DateTime? lastSessionDate) {
  if (lastSessionDate == null) {
    return current.copyWith(currentStreakDays: 1);
  }
  final today = DateUtils.dateOnly(sessionDate);
  final lastDay = DateUtils.dateOnly(lastSessionDate);
  if (today == lastDay) {
    // Same day — no streak change
    return current;
  }
  final dayDiff = today.difference(lastDay).inDays;
  if (dayDiff == 1) {
    return current.copyWith(currentStreakDays: current.currentStreakDays + 1);
  } else {
    return current.copyWith(currentStreakDays: 1);
  }
}
```

---

## Correctness Properties

*A property is a characteristic or behavior that should hold true across all valid executions of a system — essentially, a formal statement about what the system should do. Properties serve as the bridge between human-readable specifications and machine-verifiable correctness guarantees.*

### Property Reflection

Before listing properties, redundancy is eliminated:
- Properties 1.3 (custom topic validation) and 1.4 (start action enabled) are closely related but test different layers (input validation vs. UI state). Kept separate.
- Properties 4.1 (LLM generates response) and 4.5 (response displayed) both relate to the turn flow but test different concerns. Kept separate.
- Properties 6.3 (inline indicator shown) and 6.4 (tapping opens panel) are sequential UI behaviors. Kept separate.
- Properties 7.1 (session persistence round-trip) and 7.3 (session detail retrieval) can be combined — if a session is saved and retrieved by ID, it should match. Combined into one round-trip property.
- Properties 8.2 (sessions counter) and 8.3 (speaking time counter) are both about stat updates after a session. Kept separate as they test different fields.

---

### Property 1: Custom topic length validation

*For any* string submitted as a custom topic, the topic selection screen SHALL accept it if and only if its length is between 1 and 200 characters (inclusive); strings of length 0 or greater than 200 SHALL be rejected with an inline validation message and the "Start Session" action SHALL remain disabled.

**Validates: Requirements 1.3, 1.5**

---

### Property 2: Valid topic enables session start

*For any* non-empty topic (whether predefined or a custom string of 1–200 characters), confirming topic selection SHALL enable the "Start Session" action and create a new Session whose `topic` field equals the selected topic string.

**Validates: Requirements 1.4, 1.6**

---

### Property 3: Recording duration enforcement

*For any* recording session, the audio file produced by the Audio Recorder SHALL have a duration of at most 120 seconds; if the user records beyond 120 seconds, the recorder SHALL automatically stop and produce the file at exactly 120 seconds.

**Validates: Requirements 2.6, 2.7**

---

### Property 4: Transcription displayed in conversation

*For any* successful STT transcription result, the transcribed text SHALL appear as the user's message bubble in the conversation screen, and the bubble's text content SHALL equal the transcription string returned by the STT service.

**Validates: Requirements 3.5**

---

### Property 5: LLM response includes grammar corrections

*For any* user transcription and session topic, the LLM service response SHALL contain both a non-empty `responseText` string and a `grammarCorrections` list (which may be empty); the response SHALL never omit either field.

**Validates: Requirements 4.1, 6.1**

---

### Property 6: Conversation history passed to LLM

*For any* session with N completed turns, when generating the response for turn N+1, the context passed to the LLM service SHALL contain all N prior turns in chronological order.

**Validates: Requirements 4.2**

---

### Property 7: AI response displayed in conversation

*For any* successfully generated LLM response, the `responseText` SHALL appear as the AI Tutor's message bubble in the conversation screen, and the bubble's text content SHALL equal the `responseText` field of the LlmResponse.

**Validates: Requirements 4.5**

---

### Property 8: TTS triggers on AI response availability

*For any* AI Tutor response text, the TTS service SHALL be invoked with that exact text string, and playback SHALL begin automatically without requiring user interaction.

**Validates: Requirements 5.1**

---

### Property 9: Record button enabled after TTS completes

*For any* TTS playback completion event (including TTS error), the record button SHALL transition to an enabled state, allowing the user to record the next turn.

**Validates: Requirements 5.3, 5.5**

---

### Property 10: Inline indicator presence matches corrections

*For any* completed turn, the user's message bubble SHALL display an Inline Indicator if and only if the turn's `grammarCorrections` list is non-empty; turns with an empty corrections list SHALL display no indicator.

**Validates: Requirements 6.2, 6.3**

---

### Property 11: Corrections panel displays all correction fields

*For any* turn with one or more grammar corrections, the Corrections Panel SHALL display each correction with all three required fields: `originalPhrase`, `suggestedCorrection`, and `explanation`; no correction SHALL be omitted from the panel.

**Validates: Requirements 6.5**

---

### Property 12: Corrections panel dismissal preserves conversation state

*For any* conversation state (list of turns, current turn index, session topic), opening and then dismissing the Corrections Panel SHALL leave the conversation state identical to what it was before the panel was opened.

**Validates: Requirements 6.6**

---

### Property 13: Session persistence round-trip

*For any* completed session (with any topic, any number of turns, any grammar corrections), saving the session via `ConversationRepository.saveSession` and then retrieving it via `getSessionById` SHALL return a session that is structurally equal to the original, preserving all fields including nested turns and grammar corrections.

**Validates: Requirements 7.1, 7.3**

---

### Property 14: History ordered reverse chronologically

*For any* collection of saved sessions, `ConversationRepository.getAllSessions` SHALL return them in descending order of `startTime` (most recent first); for any two sessions A and B where A.startTime > B.startTime, A SHALL appear before B in the result list.

**Validates: Requirements 7.2**

---

### Property 15: Progress stats non-negativity invariant

*For any* sequence of session completions and progress updates, the `ProgressStats` record SHALL always satisfy: `sessionsCompleted >= 0`, `totalSpeakingTimeSeconds >= 0`, and `currentStreakDays >= 0`; no operation SHALL produce a negative value in any field.

**Validates: Requirements 8.1**

---

### Property 16: Sessions counter increments by one

*For any* progress stats record, completing a session SHALL increment `sessionsCompleted` by exactly 1; the new value SHALL equal the previous value plus 1.

**Validates: Requirements 8.2**

---

### Property 17: Speaking time accumulates correctly

*For any* session with a list of user recording turns, completing the session SHALL add the sum of all turn `recordingDuration` values (in seconds) to `totalSpeakingTimeSeconds`; the new total SHALL equal the previous total plus that sum.

**Validates: Requirements 8.3**

---

### Property 18: Streak calculation correctness

*For any* sequence of session completion dates, the streak counter SHALL satisfy: (a) if the current session is on the same calendar day as the last session, the streak is unchanged; (b) if the current session is on the calendar day immediately following the last session, the streak increments by 1; (c) if the gap is more than one calendar day, the streak resets to 1; (d) the streak is always ≥ 1 after any session completion.

**Validates: Requirements 8.4**

---

### Property 19: Progress stats display formatting

*For any* `ProgressStats` value, the stats screen SHALL display `totalSpeakingTimeSeconds` formatted as `H:MM` (hours and whole minutes), `sessionsCompleted` as a plain integer, and `currentStreakDays` as a plain integer; the formatted speaking time SHALL satisfy `hours * 3600 + minutes * 60 <= totalSpeakingTimeSeconds < hours * 3600 + (minutes + 1) * 60`.

**Validates: Requirements 8.5**
