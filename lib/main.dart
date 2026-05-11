import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'prod');
  await configureDependencies(environment: environment);

  runApp(const SpeakFlowApp());
}
