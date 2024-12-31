import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sql_playground/ui/window_screen.dart';

List<Widget> sideBarMenu({required ScreenWidthSize screenSize}) {
  return [
    Flex(
      direction: screenSize == ScreenWidthSize.COMPACT
          ? Axis.vertical
          : Axis.horizontal,
      children: [
        Icon(Icons.code),
        const SizedBox(
          width: 4,
          height: 4,
        ),
        Text(
          'Playground',
          style: TextStyle(
              fontSize: screenSize == ScreenWidthSize.COMPACT ? 8 : 12),
        ),
      ],
    ),
    const SizedBox(
      width: 12,
      height: 12,
    ),
    Flex(
      direction: screenSize == ScreenWidthSize.COMPACT
          ? Axis.vertical
          : Axis.horizontal,
      children: [
        Icon(Icons.dataset),
        const SizedBox(
          width: 4,
          height: 4,
        ),
        Text(
          'ERD',
          style: TextStyle(
              fontSize: screenSize == ScreenWidthSize.COMPACT ? 8 : 12),
        ),
      ],
    ),
    const SizedBox(
      width: 12,
      height: 12,
    ),
    Flex(
      direction: screenSize == ScreenWidthSize.COMPACT
          ? Axis.vertical
          : Axis.horizontal,
      children: [
        Icon(Icons.storage_rounded),
        const SizedBox(
          width: 4,
          height: 4,
        ),
        Text(
          'Databases',
          style: TextStyle(
              fontSize: screenSize == ScreenWidthSize.COMPACT ? 8 : 12),
        ),
      ],
    )
  ];
}
