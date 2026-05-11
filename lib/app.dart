import 'package:flutter/material.dart';

import 'main_shell.dart';

/// Root widget of the SpeakFlow application.
class SpeakFlowApp extends StatelessWidget {
  const SpeakFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpeakFlow',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const MainShell(),
    );
  }
}
