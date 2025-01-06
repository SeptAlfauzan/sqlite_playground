import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sql_playground/modules/playground/presentation/providers/output_container.dart';
import 'package:sql_playground/modules/playground/presentation/providers/playground.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/atoms/output_time_devider.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/organism/editor.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/organism/code_editor.dart';
import 'package:sql_playground/ui/colors.dart';
import 'package:sql_playground/ui/theme.dart';
import 'package:sql_playground/ui/window_screen.dart';

class PlaygroundView extends ConsumerStatefulWidget {
  const PlaygroundView({
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlaygroundViewState();
}

class _PlaygroundViewState extends ConsumerState<PlaygroundView> {
  String _query = '';
  @override
  Widget build(BuildContext context) {
    final screenHeightSize = WindowScreen().calculateScreenHeight(context);
    final playgroundEditorState = ref.watch(playgroundEditorProvider);
    final outputContainerHeightState = ref.watch(outputContainerProvider);

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Stack(
            children: [
              // Editor(
              //   height: double.infinity,
              //   onUpdate: (query) {
              //     setState(
              //       () {
              //         _query = query;
              //       },
              //     );
              //   },
              // ),
              CodeEditor(
                  height: double.infinity,
                  onUpdate: (query) {
                    setState(() {
                      _query = query;
                    });
                  }),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(Colors.black),
                      backgroundColor: WidgetStateProperty.all(AppColors.lime),
                    ),
                    onPressed: () async {
                      await ref
                          .read(playgroundEditorProvider.notifier)
                          .executeQuery(sql: _query);
                    },
                    child: const Text("Run"),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          thickness: 0.4,
          endIndent: 0,
          color: Colors.grey,
        ),
        SizedBox(
          height: outputContainerHeightState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.resizeUpDown,
                child: GestureDetector(
                  onVerticalDragUpdate: (event) {
                    ref
                        .read(outputContainerProvider.notifier)
                        .resize(deltaY: event.delta.dy, context: context);
                  },
                  child: const OutputTimeDevider(),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: playgroundEditorState.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const CircularProgressIndicator(),
                    success: (data) => Text(data),
                    fail: (error) => SingleChildScrollView(
                      child: Text(error,
                          style: TextStyle(
                              fontSize: 12,
                              color: getDarkTheme().colorScheme.onError)),
                    ),
                  ),
                ),

                //Datatable(
                //  records: _userRecord,
                //),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
