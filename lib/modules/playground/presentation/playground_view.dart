import 'package:flutter/material.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/atoms/datatable.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/organism/editor.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

class PlaygroundView extends StatefulWidget {
  final List<Map<String, dynamic>> records;
  const PlaygroundView({super.key, required this.records});
  @override
  State<PlaygroundView> createState() => _PlaygroundViewState();
}

class _PlaygroundViewState extends State<PlaygroundView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Datatable(
          records: widget.records,
        ),
        const Editor(
          height: 200,
        )
      ],
    );
  }
}
