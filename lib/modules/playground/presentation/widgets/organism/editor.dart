import 'package:flutter/material.dart';
import 'package:sql_playground/ui/colors.dart';
import 'package:syntax_highlight/syntax_highlight.dart';

class Editor extends StatefulWidget {
  final double height;
  final Function(String code) onUpdate;
  const Editor({super.key, required this.height, required this.onUpdate});
  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
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
      widget.onUpdate(_editorController.text);
    }
  }

  Future<Highlighter> initHighlighter() async {
    await Highlighter.initialize(['sql']);
    final theme = await HighlighterTheme.loadDarkTheme();
    return Highlighter(
      language: 'sql',
      theme: theme,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.darkBlack,
        padding: const EdgeInsets.all(0),
        height: widget.height,
        child: FutureBuilder<Highlighter>(
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

            return Stack(
              children: [
                TextField(
                  expands: true,
                  controller: _editorController,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 14,
                    letterSpacing: 1,
                    fontFamily: 'monospace',
                    color: Colors.transparent,
                    shadows: [
                      Shadow(
                        color: Colors.transparent,
                        offset: Offset.zero,
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(24, 8, 24, 0),
                    border: InputBorder.none,
                    fillColor: Colors.transparent,
                    filled: true,
                  ),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                  child: Text.rich(
                    _hightlighedCode,
                    style: const TextStyle(
                      letterSpacing: 1,
                      height: 1.5,
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
