import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
// Import the language & theme
import 'package:highlight/languages/sql.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';

class CodeEditor extends StatefulWidget {
  final double height;
  final Function(String code) onUpdate;
  const CodeEditor({super.key, required this.height, required this.onUpdate});
  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    final source = "void main() {\n    print(\"Hello, world!\");\n}";
    // Instantiate the CodeController
    _codeController = CodeController(
      text: source,
      language: sql,
    );

    _codeController?.addListener(_onUpdate);
  }

  void _onUpdate() {
    if (_codeController?.text != null) ;
    widget.onUpdate(_codeController!.text);
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: CodeField(
        controller: _codeController!,
        textStyle: TextStyle(fontFamily: 'SourceCode'),
      ),
    );
  }
}
