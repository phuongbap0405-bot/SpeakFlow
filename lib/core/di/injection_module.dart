import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// Injectable module that provides platform-level singletons.
///
/// [SharedPreferences] is registered with [@preResolve] so that
/// `configureDependencies()` can be awaited — the instance is fully
/// initialised before any dependent class is constructed.
@module
abstract class AppModule {
  /// Provides the [SharedPreferences] singleton.
  ///
  /// [@preResolve] tells injectable to `await` this factory during
  /// `configureDependencies()`, making the result available synchronously
  /// to every class that depends on it.
  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  /// Provides the [Uuid] singleton for generating unique identifiers.
  @singleton
  Uuid get uuid => const Uuid();
}
