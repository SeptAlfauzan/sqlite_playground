import 'package:flutter/material.dart';
import 'package:sql_playground/modules/playground/presentation/playground_view.dart';
import 'package:sql_playground/ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Playground',
      theme: getDarkTheme(),
      themeMode: ThemeMode.dark,
      home: const PlaygroundView(),
    );
  }
}
