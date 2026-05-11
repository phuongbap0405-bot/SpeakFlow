# Requirements Document

## Introduction

SpeakFlow is a Flutter application that helps intermediate English learners — particularly software engineers — practice spoken English conversations with an AI tutor. Users select a conversation topic, record their speech, receive an AI-generated conversational response (displayed and spoken aloud), and get inline grammar corrections with a detailed corrections panel. Conversation history is stored locally and basic progress statistics are tracked. All AI services (STT, LLM, TTS) and storage are abstracted behind interfaces to allow provider swapping without architectural changes.

## Glossary

- **SpeakFlow**: The Flutter application being built.
- **User**: An intermediate English learner using SpeakFlow to practice spoken English.
- **Topic**: A conversation subject selected by the User, either from a predefined list or entered as a free-form custom string.
- **Session**: A single continuous conversation between the User and the AI Tutor, consisting of one or more turns.
- **Turn**: One exchange unit — the User's spoken input followed by the AI Tutor's response.
- **AI Tutor**: The conversational AI component that generates responses, powered by an LLM provider.
- **STT Service**: The Speech-to-Text service that transcribes recorded audio to text (MVP: OpenAI Whisper).
- **LLM Service**: The Large Language Model service that generates conversational responses (MVP: OpenAI GPT-4o).
- **TTS Service**: The Text-to-Speech service that synthesizes AI Tutor responses into audio (MVP: OpenAI TTS).
- **Audio Recorder**: The device component that captures the User's microphone input.
- **Grammar Correction**: An identified grammatical error in the User's transcribed speech, with a suggested correction and explanation.
- **Inline Indicator**: A subtle visual marker within a conversation bubble that signals the presence of Grammar Corrections.
- **Corrections Panel**: A detailed overlay or bottom sheet that lists all Grammar Corrections for a given Turn, opened by tapping the Inline Indicator.
- **Conversation History**: The persisted record of all Sessions and their Turns stored on the device.
- **Progress Stats**: Aggregated metrics — sessions completed, total speaking time, and streak counter — stored locally.
- **Streak**: The count of consecutive calendar days on which the User completed at least one Session.
- **Repository**: A data-access abstraction that decouples the domain layer from storage and network implementations.
- **Use Case**: A single-responsibility domain-layer class that encapsulates one piece of business logic.
- **Bloc**: A state-management component following the BLoC pattern, used in the presentation layer.
- **Clean Architecture**: The three-layer architecture (presentation / domain / data) enforced throughout SpeakFlow.
- **DI Container**: The dependency injection container managed by get_it and injectable.

---

## Requirements

### Requirement 1: Topic Selection

**User Story:** As a User, I want to choose a conversation topic before starting a Session, so that I can practice English in a context relevant to my goals.

#### Acceptance Criteria

1. THE SpeakFlow SHALL display a topic selection screen as the entry point to starting a new Session.
2. THE SpeakFlow SHALL present a predefined list of topics including at minimum: Job Interviews, Daily Life, and Tech Discussions.
3. THE SpeakFlow SHALL provide a free-form text input field on the topic selection screen that accepts a custom topic string of 1–200 characters.
4. WHEN the User selects a predefined topic or submits a non-empty custom topic, THE SpeakFlow SHALL enable the "Start Session" action.
5. IF the User submits an empty custom topic string, THEN THE SpeakFlow SHALL display an inline validation message and SHALL NOT enable the "Start Session" action.
6. WHEN the User confirms topic selection, THE SpeakFlow SHALL create a new Session associated with the chosen topic and navigate to the conversation screen.

---

### Requirement 2: Audio Recording

**User Story:** As a User, I want to record my spoken English, so that my speech can be transcribed and evaluated by the AI Tutor.

#### Acceptance Criteria

1. THE Audio Recorder SHALL request microphone permission from the device operating system before the first recording attempt.
2. IF microphone permission is denied, THEN THE SpeakFlow SHALL display an explanatory message and SHALL provide a prompt to open device settings.
3. WHEN the User presses the record button, THE Audio Recorder SHALL begin capturing microphone audio.
4. WHILE recording is active, THE SpeakFlow SHALL display a visual recording indicator showing elapsed recording time updated at least once per second.
5. WHEN the User presses the stop button, THE Audio Recorder SHALL stop capturing audio and SHALL produce an audio file for processing.
6. THE Audio Recorder SHALL enforce a maximum recording duration of 120 seconds per Turn.
7. WHEN the maximum recording duration is reached, THE Audio Recorder SHALL automatically stop recording and SHALL produce the audio file for processing.
8. IF an audio capture error occurs during recording, THEN THE SpeakFlow SHALL display an error message and SHALL allow the User to retry recording.

---

### Requirement 3: Speech-to-Text Transcription

**User Story:** As a User, I want my recorded speech automatically converted to text, so that the AI Tutor can understand and respond to what I said.

#### Acceptance Criteria

1. WHEN an audio file is produced by the Audio Recorder, THE STT Service SHALL transcribe the audio to a text string.
2. WHILE transcription is in progress, THE SpeakFlow SHALL display a loading indicator within the conversation screen.
3. IF the STT Service returns an error, THEN THE SpeakFlow SHALL display an error message and SHALL allow the User to retry the transcription for the same audio file.
4. IF the STT Service returns an empty transcription, THEN THE SpeakFlow SHALL display a message informing the User that no speech was detected and SHALL allow the User to re-record.
5. WHEN transcription succeeds, THE SpeakFlow SHALL display the transcribed text as the User's message bubble in the conversation screen.
6. THE STT Service interface SHALL be defined in the domain layer with no dependency on any external package or framework.

---

### Requirement 4: AI Tutor Response Generation

**User Story:** As a User, I want the AI Tutor to reply conversationally to what I said, so that I can practice a realistic back-and-forth English conversation.

#### Acceptance Criteria

1. WHEN a transcription is available for a Turn, THE LLM Service SHALL generate a conversational response in English relevant to the Session topic.
2. THE LLM Service SHALL include the full conversation history of the current Session as context when generating each response, up to the provider's context limit.
3. WHILE response generation is in progress, THE SpeakFlow SHALL display a loading indicator within the conversation screen.
4. IF the LLM Service returns an error, THEN THE SpeakFlow SHALL display an error message and SHALL allow the User to retry response generation for the same Turn.
5. WHEN a response is generated, THE SpeakFlow SHALL display the response text as the AI Tutor's message bubble in the conversation screen.
6. THE LLM Service interface SHALL be defined in the domain layer with no dependency on any external package or framework.

---

### Requirement 5: Text-to-Speech Playback

**User Story:** As a User, I want to hear the AI Tutor's response spoken aloud, so that I can improve my listening comprehension alongside speaking practice.

#### Acceptance Criteria

1. WHEN an AI Tutor response text is available, THE TTS Service SHALL synthesize the response text into audio and SHALL begin playback automatically.
2. WHILE TTS audio is playing, THE SpeakFlow SHALL display a visual playback indicator on the AI Tutor's message bubble.
3. WHEN TTS playback completes, THE SpeakFlow SHALL enable the record button so the User can record the next Turn.
4. THE SpeakFlow SHALL provide a button to replay the most recent AI Tutor TTS audio at any time during the Session.
5. IF the TTS Service returns an error, THEN THE SpeakFlow SHALL display an error message, SHALL skip audio playback, and SHALL still enable the record button.
6. THE TTS Service interface SHALL be defined in the domain layer with no dependency on any external package or framework.

---

### Requirement 6: Grammar Correction Display

**User Story:** As a User, I want to see grammar corrections for what I said, so that I can learn from my mistakes and improve my English accuracy.

#### Acceptance Criteria

1. WHEN a transcription is available for a Turn, THE LLM Service SHALL identify Grammar Corrections in the transcribed text and SHALL return them alongside the conversational response.
2. IF no Grammar Corrections are identified for a Turn, THEN THE SpeakFlow SHALL display the User's message bubble without an Inline Indicator.
3. WHEN one or more Grammar Corrections exist for a Turn, THE SpeakFlow SHALL display an Inline Indicator on the User's message bubble.
4. WHEN the User taps the Inline Indicator, THE SpeakFlow SHALL open the Corrections Panel for that Turn.
5. THE Corrections Panel SHALL display each Grammar Correction with the original phrase, the suggested correction, and a brief explanation.
6. WHEN the User dismisses the Corrections Panel, THE SpeakFlow SHALL return focus to the conversation screen without losing conversation state.

---

### Requirement 7: Conversation History Storage

**User Story:** As a User, I want my past conversations saved on my device, so that I can review previous Sessions and track my learning over time.

#### Acceptance Criteria

1. WHEN a Session ends, THE SpeakFlow SHALL persist the Session record — including topic, start time, end time, and all Turns with their transcriptions, AI Tutor responses, and Grammar Corrections — to local storage.
2. THE SpeakFlow SHALL display a history screen listing all past Sessions in reverse chronological order.
3. WHEN the User selects a past Session from the history screen, THE SpeakFlow SHALL display the full Turn-by-Turn conversation for that Session in read-only mode.
4. THE Conversation Repository interface SHALL be defined in the domain layer with no dependency on any external package or framework.
5. THE Conversation Repository implementation SHALL use shared_preferences for the MVP storage backend.
6. WHERE a future storage migration is required, THE SpeakFlow SHALL support replacing the shared_preferences implementation with a local database implementation without changes to the domain layer.

---

### Requirement 8: Progress Tracking

**User Story:** As a User, I want to see my practice statistics, so that I can stay motivated and monitor my consistency.

#### Acceptance Criteria

1. THE SpeakFlow SHALL maintain a Progress Stats record containing: total sessions completed (integer ≥ 0), total speaking time in seconds (integer ≥ 0), and current streak in days (integer ≥ 0).
2. WHEN a Session ends, THE SpeakFlow SHALL increment the sessions-completed counter by 1.
3. WHEN a Session ends, THE SpeakFlow SHALL add the total duration of all User recording turns in that Session to the total speaking time counter.
4. WHEN a Session is completed on a calendar day with no prior Session completed that day, THE SpeakFlow SHALL evaluate the streak: if the previous Session was completed on the immediately preceding calendar day, THE SpeakFlow SHALL increment the streak counter by 1; otherwise THE SpeakFlow SHALL reset the streak counter to 1.
5. THE SpeakFlow SHALL display the Progress Stats on a dedicated stats screen showing sessions completed, total speaking time formatted as hours and minutes, and the current streak in days.
6. THE Progress Repository interface SHALL be defined in the domain layer with no dependency on any external package or framework.

---

### Requirement 9: Provider-Swappable AI Service Architecture

**User Story:** As a solo developer, I want all AI service integrations abstracted behind interfaces, so that I can swap providers without rewriting business logic.

#### Acceptance Criteria

1. THE SpeakFlow SHALL define the STT Service, LLM Service, and TTS Service as abstract interfaces in the domain layer.
2. THE SpeakFlow SHALL provide concrete implementations of each AI service interface in the data layer, with the MVP implementations using OpenAI Whisper (STT), OpenAI GPT-4o (LLM), and OpenAI TTS (TTS).
3. THE DI Container SHALL bind each AI service interface to its concrete implementation, allowing the binding to be changed without modifying domain or presentation layer code.
4. THE SpeakFlow SHALL use dio as the HTTP client within data-layer AI service implementations.
5. WHERE a non-OpenAI provider implementation is substituted, THE SpeakFlow SHALL continue to function correctly without changes to any Use Case or Bloc.

---

### Requirement 10: Clean Architecture and Code Quality

**User Story:** As a solo developer, I want the codebase to follow Clean Architecture and established Flutter conventions, so that the app is maintainable and scalable as features are added.

#### Acceptance Criteria

1. THE SpeakFlow SHALL organize code into three layers — presentation, domain, and data — with dependencies pointing inward (presentation → domain ← data).
2. THE domain layer SHALL contain no imports from Flutter framework packages, external HTTP libraries, or storage libraries.
3. THE SpeakFlow SHALL use Bloc for all presentation-layer state management, with sealed event and state classes generated using freezed.
4. THE SpeakFlow SHALL use get_it and injectable for dependency injection across all layers.
5. THE SpeakFlow SHALL use freezed and json_serializable for all data model and domain entity definitions.
6. THE SpeakFlow SHALL define one Use Case class per business operation, each with a single public method and a single responsibility.
7. THE SpeakFlow SHALL follow a feature-first directory structure, grouping presentation, domain, and data sub-layers within each feature directory.
8. IF a class accumulates more than one distinct responsibility, THEN THE SpeakFlow codebase SHALL be refactored to separate those responsibilities into distinct classes before the feature is considered complete.
