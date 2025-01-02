import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sql_playground/modules/app.dart';
import 'package:sql_playground/ui/theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
      //home: const ContainerPage(),
      home: const App(),
      debugShowCheckedModeBanner: false,
    );
  }
}
