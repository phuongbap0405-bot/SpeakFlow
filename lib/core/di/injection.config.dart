// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:speakflow/core/di/injection_module.dart' as _i1070;
import 'package:speakflow/core/network/dio_client.dart' as _i510;
import 'package:speakflow/features/conversation/data/services/audio_recorder_impl.dart'
    as _i327;
import 'package:speakflow/features/conversation/data/services/flutter_tts_service.dart'
    as _i324;
import 'package:speakflow/features/conversation/data/services/gemini_llm_service.dart'
    as _i141;
import 'package:speakflow/features/conversation/data/services/gemini_stt_service.dart'
    as _i502;
import 'package:speakflow/features/conversation/data/services/mock_llm_service.dart'
    as _i1010;
import 'package:speakflow/features/conversation/data/services/mock_stt_service.dart'
    as _i252;
import 'package:speakflow/features/conversation/data/services/mock_tts_service.dart'
    as _i259;
import 'package:speakflow/features/conversation/domain/services/audio_recorder.dart'
    as _i58;
import 'package:speakflow/features/conversation/domain/services/llm_service.dart'
    as _i373;
import 'package:speakflow/features/conversation/domain/services/stt_service.dart'
    as _i505;
import 'package:speakflow/features/conversation/domain/services/tts_service.dart'
    as _i9;
import 'package:speakflow/features/conversation/domain/use_cases/end_session_use_case.dart'
    as _i131;
import 'package:speakflow/features/conversation/domain/use_cases/generate_turn_response_use_case.dart'
    as _i349;
import 'package:speakflow/features/conversation/domain/use_cases/start_session_use_case.dart'
    as _i413;
import 'package:speakflow/features/conversation/domain/use_cases/synthesize_speech_use_case.dart'
    as _i583;
import 'package:speakflow/features/conversation/domain/use_cases/transcribe_audio_use_case.dart'
    as _i317;
import 'package:speakflow/features/history/data/repositories/shared_prefs_conversation_repository.dart'
    as _i747;
import 'package:speakflow/features/history/domain/repositories/conversation_repository.dart'
    as _i172;
import 'package:speakflow/features/history/domain/use_cases/get_session_detail_use_case.dart'
    as _i182;
import 'package:speakflow/features/history/domain/use_cases/get_sessions_use_case.dart'
    as _i876;
import 'package:speakflow/features/history/presentation/bloc/history_bloc.dart'
    as _i981;
import 'package:speakflow/features/progress/data/repositories/shared_prefs_progress_repository.dart'
    as _i237;
import 'package:speakflow/features/progress/domain/repositories/progress_repository.dart'
    as _i821;
import 'package:speakflow/features/progress/domain/use_cases/get_progress_stats_use_case.dart'
    as _i848;
import 'package:speakflow/features/progress/domain/use_cases/update_progress_stats_use_case.dart'
    as _i184;
import 'package:speakflow/features/progress/presentation/bloc/progress_bloc.dart'
    as _i1015;
import 'package:speakflow/features/topic_selection/presentation/bloc/topic_bloc.dart'
    as _i683;
import 'package:uuid/uuid.dart' as _i706;

const String _dev = 'dev';
const String _prod = 'prod';
const String _mock = 'mock';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    final networkModule = _$NetworkModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true,
    );
    gh.singleton<_i706.Uuid>(() => appModule.uuid);
    gh.singleton<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i9.TtsService>(
      () => _i324.FlutterTtsService(),
      registerFor: {_dev, _prod},
    );
    gh.factory<_i58.AudioRecorder>(() => _i327.AudioRecorderImpl());
    gh.factory<_i505.SttService>(
      () => _i252.MockSttService(),
      registerFor: {_mock},
    );
    gh.factory<_i373.LlmService>(
      () => _i141.GeminiLlmService(gh<_i361.Dio>()),
      registerFor: {_dev, _prod},
    );
    gh.factory<_i413.StartSessionUseCase>(
      () => _i413.StartSessionUseCase(gh<_i706.Uuid>()),
    );
    gh.factory<_i505.SttService>(
      () => _i502.GeminiSttService(gh<_i361.Dio>()),
      registerFor: {_dev, _prod},
    );
    gh.factory<_i373.LlmService>(
      () => _i1010.MockLlmService(),
      registerFor: {_mock},
    );
    gh.factory<_i9.TtsService>(
      () => _i259.MockTtsService(),
      registerFor: {_mock},
    );
    gh.factory<_i317.TranscribeAudioUseCase>(
      () => _i317.TranscribeAudioUseCase(gh<_i505.SttService>()),
    );
    gh.factory<_i821.ProgressRepository>(
      () => _i237.SharedPrefsProgressRepository(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i172.ConversationRepository>(
      () => _i747.SharedPrefsConversationRepository(
        gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i683.TopicBloc>(
      () => _i683.TopicBloc(gh<_i413.StartSessionUseCase>()),
    );
    gh.factory<_i349.GenerateTurnResponseUseCase>(
      () => _i349.GenerateTurnResponseUseCase(gh<_i373.LlmService>()),
    );
    gh.factory<_i583.SynthesizeSpeechUseCase>(
      () => _i583.SynthesizeSpeechUseCase(gh<_i9.TtsService>()),
    );
    gh.factory<_i182.GetSessionDetailUseCase>(
      () => _i182.GetSessionDetailUseCase(gh<_i172.ConversationRepository>()),
    );
    gh.factory<_i876.GetSessionsUseCase>(
      () => _i876.GetSessionsUseCase(gh<_i172.ConversationRepository>()),
    );
    gh.factory<_i848.GetProgressStatsUseCase>(
      () => _i848.GetProgressStatsUseCase(gh<_i821.ProgressRepository>()),
    );
    gh.factory<_i184.UpdateProgressStatsUseCase>(
      () => _i184.UpdateProgressStatsUseCase(gh<_i821.ProgressRepository>()),
    );
    gh.factory<_i131.EndSessionUseCase>(
      () => _i131.EndSessionUseCase(
        gh<_i172.ConversationRepository>(),
        gh<_i184.UpdateProgressStatsUseCase>(),
      ),
    );
    gh.factory<_i981.HistoryBloc>(
      () => _i981.HistoryBloc(
        gh<_i876.GetSessionsUseCase>(),
        gh<_i182.GetSessionDetailUseCase>(),
      ),
    );
    gh.factory<_i1015.ProgressBloc>(
      () => _i1015.ProgressBloc(gh<_i848.GetProgressStatsUseCase>()),
    );
    return this;
  }
}

class _$AppModule extends _i1070.AppModule {}

class _$NetworkModule extends _i510.NetworkModule {}
