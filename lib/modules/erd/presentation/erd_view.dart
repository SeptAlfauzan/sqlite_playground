import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sql_playground/modules/erd/domain/dto/erd_visualizator_dto.dart';
import 'package:sql_playground/modules/erd/domain/dto/position.dart';
import 'package:sql_playground/modules/erd/presentation/providers/erd_actions.dart';
import 'package:sql_playground/modules/erd/presentation/providers/erd_line_connector.dart';
import 'package:sql_playground/modules/erd/presentation/providers/erd_visualizator.dart';
import 'package:sql_playground/modules/erd/presentation/widgets/atoms/erd_table.dart';
import 'package:sql_playground/modules/erd/presentation/widgets/atoms/line_connector.dart';

class ErdView extends ConsumerStatefulWidget {
  const ErdView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ErdViewState();
}

class _ErdViewState extends ConsumerState<ErdView> {
  final GlobalKey _erdContainerKey = GlobalKey();
  final GlobalKey _repaintBoundary = GlobalKey();
  Offset startPoint = const Offset(0, 0);
  Offset destPoint = const Offset(0, 0);
  double _containerX = 0;
  double _containerY = 0;
  Size _widgetSize = const Size(0, 0);
  double _containerScale = 1;
  List<Size> erdTablesSize = [];

  void getWidgetSize() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_erdContainerKey.currentContext == null) return;
      final box =
          _erdContainerKey.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        _widgetSize = box.size;
      });
    });
  }

  @override
  void initState() {
    getWidgetSize();
    Future.microtask(() async {
      await ref
          .read<ErdVisualizator>(erdVisualizatorProvider.notifier)
          .getTablesInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final erdisualizatorState =
        ref.watch<ErdVisualizatorDto>(erdVisualizatorProvider);
    final erdLineConnectorState = ref.watch(erdLineConnectorProvider);

    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _containerScale += 0.1;
              });
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _containerScale -= 0.1;
              });
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              final Position position = ref
                  .read(erdActionsProvider.notifier)
                  .moveToCenterContainer(widgetSize: _widgetSize);
              setState(() {
                _containerY = position.y;
                _containerX = position.x;
              });
            },
            child: const Icon(Icons.center_focus_strong_outlined),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              Future.microtask(() async {
                try {
                  final renderObject =
                      _repaintBoundary.currentContext?.findRenderObject();

                  if (renderObject == null) return;

                  RenderRepaintBoundary boundary =
                      renderObject as RenderRepaintBoundary;

                  await ref
                      .read(erdActionsProvider.notifier)
                      .saveERD(boundary: boundary);
                } catch (e) {
                  print(e);
                }
              });
            },
            child: const Icon(Icons.download),
          )
        ],
      ),
      body: RepaintBoundary(
        key: _repaintBoundary,
        child: GestureDetector(
          onPanUpdate: (drag) {
            final deltaX = drag.delta.dx;
            final deltaY = drag.delta.dy;

            setState(() {
              _containerY += deltaY;
              _containerX += deltaX;
            });
          },
          child: erdisualizatorState.when(
            initial: () => const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              ),
            ),
            loading: () => const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              ),
            ),
            success: (data) => GloballyTranslateStackedWidgets(
              scale: _containerScale,
              key: _erdContainerKey,
              //need to mulply with _containerScale to match with current container scale
              offset: Offset(_containerX, _containerY),
              children: data.tables.isEmpty
                  ? []
                  : [
                      //line connector
                      ...erdLineConnectorState.map(
                        (line) => CustomPaint(
                          painter: LineConnector(
                            startPoint: Offset(
                                line.firstEntityPos.x, line.firstEntityPos.y),
                            destPoint: Offset(
                                line.secondEntityPos.x, line.secondEntityPos.y),
                            onErrorDraw: (error) {
                              print(error);
                            },
                          ),
                          child: Container(),
                        ),
                      ),
                      //table erd
                      ...data.tables.asMap().map((index, tableInfo) {
                        // print(erdTablesSize);
                        return MapEntry(
                          index,
                          ErdTable(
                            // key: Key(index.toString()),
                            tableInfo: tableInfo,
                            useCenterOfTableUpdateLocation: true,
                            initialXpos: index * 300,
                            initialYpos: 0,
                            // onLoadBoxSize: (size) {
                            //   if (mounted) {
                            //     // Check if widget is still mounted
                            //     setState(() {
                            //       erdTablesSize.add(size);
                            //     });
                            //   }
                            // },
                            onDragUpdate: (offset) {
                              setState(
                                () {
                                  startPoint = offset;
                                  ref
                                      .read(erdLineConnectorProvider.notifier)
                                      .updateLineConnectorPosition(
                                        entityName: tableInfo.tableName,
                                        entityPosition: Position(
                                          x: offset.dx,
                                          y: offset.dy,
                                        ),
                                      );
                                },
                              );
                            },
                          ),
                        );
                      }).values

                      // CustomPaint(
                      //   painter: LineConnector(
                      //     startPoint: startPoint,
                      //     destPoint: destPoint,
                      //     onErrorDraw: (error) {
                      //       print(error);
                      //     },
                      //   ),
                      //   child: Container(),
                      // ),
                      // ErdTable(
                      //   useCenterOfTableUpdateLocation: true,
                      //   initialXpos: 0,
                      //   initialYpos: 0,
                      //   onDragUpdate: (offset) {
                      //     setState(() {
                      //       startPoint = offset;
                      //     });
                      //   },
                      // ),
                      // ErdTable(
                      //   useCenterOfTableUpdateLocation: true,
                      //   initialXpos: 0,
                      //   initialYpos: 0,
                      //   onDragUpdate: (offset) {
                      //     setState(() {
                      //       destPoint = offset;
                      //     });
                      //   },
                      // ),
                    ],
            ),
            fail: (error) => Text(error),
          ),
        ),
      ),
    );
  }
}

class GloballyTranslateStackedWidgets extends StatelessWidget {
  final List<Widget> children;
  final Offset offset;
  final double scale;
  const GloballyTranslateStackedWidgets({
    super.key,
    required this.offset,
    required this.children,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      width: double.infinity,
      height: double.infinity,
      child: Transform.scale(
        scale: scale,
        child: Stack(
          children: children
              .map(
                (child) => Transform.translate(
                  offset: offset,
                  child: child,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
