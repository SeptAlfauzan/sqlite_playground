import 'package:flutter/material.dart';
import 'package:sql_playground/common/presentation/widget/atoms/sidebar_menus.dart';
import 'package:sql_playground/modules/playground/presentation/playground_view.dart';
import 'package:sql_playground/ui/theme.dart';
import 'package:sql_playground/ui/window_screen.dart';

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
      home: const ContainerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContainerPage extends StatefulWidget {
  const ContainerPage({super.key});

  @override
  State<ContainerPage> createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = WindowScreen().calculateScreenWidthSize(context);

    return Material(
      child: Flex(
        direction: screenSize == ScreenWidthSize.COMPACT
            ? Axis.vertical
            : Axis.horizontal,
        children: screenSize == ScreenWidthSize.COMPACT
            ? _buildChildren(screenSize).reversed.toList()
            : _buildChildren(screenSize),
      ),
    );
  }

  List<Widget> _buildChildren(ScreenWidthSize screenSize) {
    return [
      Container(
        height: screenSize == ScreenWidthSize.COMPACT ? 56 : double.infinity,
        color: Colors.black,
        padding: const EdgeInsets.all(8),
        child: Flex(
          mainAxisAlignment: screenSize == ScreenWidthSize.COMPACT
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          crossAxisAlignment: screenSize == ScreenWidthSize.COMPACT
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          direction: screenSize == ScreenWidthSize.COMPACT
              ? Axis.horizontal
              : Axis.vertical,
          children: sideBarMenu(screenSize: screenSize),
        ),
      ),
      Expanded(
        child: const PlaygroundView(),
      ),
    ];
  }
}
