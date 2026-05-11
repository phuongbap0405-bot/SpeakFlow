import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

/// The global service locator instance used throughout the app.
final GetIt getIt = GetIt.instance;

/// Initialises the dependency injection container.
///
/// Must be called (and awaited) before [runApp]:
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await configureDependencies();
///   runApp(const MyApp());
/// }
/// ```
///
/// The [@preResolve] factories (e.g. [SharedPreferences]) are awaited
/// automatically by the generated `$initGetIt` function, so the returned
/// [Future] resolves only after every async dependency is ready.
@InjectableInit()
Future<void> configureDependencies({String? environment}) =>
    getIt.init(environment: environment);
