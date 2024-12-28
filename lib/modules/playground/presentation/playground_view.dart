import 'package:flutter/material.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

class PlaygroundView extends StatefulWidget {
  const PlaygroundView({super.key});
  @override
  State<PlaygroundView> createState() => _PlaygroundViewState();
}

class _PlaygroundViewState extends State<PlaygroundView> {
  late Future<Highlighter> _highlighter;
  TextSpan _hightlighedCode = const TextSpan();
  final TextEditingController _editorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _highlighter = initHighlighter();
    _editorController.addListener(_onEditorChanged);
  }

  void _onEditorChanged() async {
    final hightLighter = await _highlighter;
    if (mounted) {
      setState(() {
        _hightlighedCode = hightLighter.highlight(_editorController.text);
      });
    }
  }

  Future<Highlighter> initHighlighter() async {
    await Highlighter.initialize(['sql']);
    final theme = await HighlighterTheme.loadDarkTheme();
    return Highlighter(language: 'sql', theme: theme);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Highlighter>(
      future: _highlighter,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData) {
          return const Text('No highlighter available');
        }

        return Container(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
          child: Stack(
            children: [
              TextField(
                controller: _editorController,
                style: TextStyle(
                  height: 1.5,
                  fontSize: 14,
                  fontFamily: 'monospace',
                  color: Colors.transparent,
                  shadows: [
                    Shadow(
                      color: Colors.white.withOpacity(0.5),
                      offset: Offset.zero,
                      blurRadius: 0,
                    ),
                  ],
                ),
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                  filled: true,
                ),
                maxLines: null,
                keyboardType: TextInputType.multiline,
              ),
              Text.rich(
                _hightlighedCode,
                style: const TextStyle(
                  height: 1.5,
                  fontFamily: 'monospace',
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
