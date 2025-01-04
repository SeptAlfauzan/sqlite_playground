import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sql_playground/helper/image_saver.dart';
import 'package:sql_playground/modules/erd/domain/dto/erd_visualizator_dto.dart';
import 'package:sql_playground/modules/erd/presentation/providers/erd_visualizator.dart';
import 'package:sql_playground/modules/erd/presentation/widgets/atoms/erd_table.dart';
import 'package:sql_playground/modules/erd/presentation/widgets/atoms/line_connector.dart';
import 'dart:ui' as ui;

import 'package:sql_playground/ui/colors.dart';

class ErdView extends ConsumerStatefulWidget {
  const ErdView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ErdViewState();
}

class _ErdViewState extends ConsumerState<ErdView> {
  GlobalKey _erdContainerKey = GlobalKey();
  GlobalKey _repaintBoundary = GlobalKey();
  Offset startPoint = const Offset(0, 0);
  Offset destPoint = const Offset(0, 0);
  double _containerX = 0;
  double _containerY = 0;
  bool _touched = false;
  Size _widgetSize = const Size(0, 0);
  double _containerScale = 1.0;
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

  void moveToCenterContainer() {
    setState(() {
      _containerY = _widgetSize.height / 2;
      _containerX = _widgetSize.width / 2;
    });
  }

  Future<Uint8List> exportToImgBytes() async {
    RenderRepaintBoundary boundary = _repaintBoundary.currentContext!
        .findRenderObject() as RenderRepaintBoundary;

    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData == null) throw Exception('Byte data is null');
    Uint8List pngBytes = byteData.buffer.asUint8List();
    final bs64 = base64Encode(pngBytes);

    return pngBytes;
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
            child: Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _containerScale -= 0.1;
              });
            },
            child: Icon(Icons.remove),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: moveToCenterContainer,
            child: Icon(Icons.center_focus_strong_outlined),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              Future.microtask(() async {
                try {
                  final bytes = await exportToImgBytes();
                  await ImageSaver.saveImage(bytes: bytes);
                } catch (e) {
                  print(e);
                }
              });
            },
            child: Icon(Icons.download),
          )
        ],
      ),
      body: RepaintBoundary(
        key: _repaintBoundary,
        child: GestureDetector(
          // onTapDown: (_) {
          //   setState(() {
          //     _touched = true;
          //   });
          // },
          // onTapUp: (_) {
          //   setState(() {
          //     _touched = false;
          //   });
          // },
          onPanUpdate: (drag) {
            // if (!_touched) return;
            final deltaX = drag.delta.dx;
            final deltaY = drag.delta.dy;

            setState(() {
              _containerY += deltaY;
              _containerX += deltaX;
            });
          },
          child: Transform.scale(
            scale: _containerScale,
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
                key: _erdContainerKey,
                //need to mulply with _containerScale to match with current container scale
                offset: Offset(_containerX, _containerY),
                children: data.tables.isEmpty
                    ? []
                    : [
                        ...data.tables
                            .asMap()
                            .map((index, tableInfo) {
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
                                    setState(() {
                                      startPoint = offset;
                                    });
                                  },
                                ),
                              );
                            })
                            .values
                            .toList()
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
      ),
    );
  }
}

class GloballyTranslateStackedWidgets extends StatelessWidget {
  final List<Widget> children;
  final Offset offset;
  const GloballyTranslateStackedWidgets({
    super.key,
    required this.offset,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      width: double.infinity,
      height: double.infinity,
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
    );
  }
}
