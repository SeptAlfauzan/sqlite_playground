import 'package:flutter/material.dart';
import 'package:sql_playground/modules/erd/presentation/widgets/atoms/erd_table.dart';
import 'package:sql_playground/modules/erd/presentation/widgets/atoms/line_connector.dart';

class ErdView extends StatefulWidget {
  const ErdView({super.key});

  @override
  State<ErdView> createState() => _ErdViewState();
}

class _ErdViewState extends State<ErdView> {
  GlobalKey _key = GlobalKey();
  Offset startPoint = const Offset(0, 0);
  Offset destPoint = const Offset(0, 0);
  double _containerX = 0;
  double _containerY = 0;
  bool _touched = false;
  Size _widgetSize = Size(0, 0);
  double _containerScale = 1.0;

  void getWidgetSize() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (_key.currentContext == null) return;
      final box = _key.currentContext!.findRenderObject() as RenderBox;
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

  @override
  void initState() {
    getWidgetSize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
        ],
      ),
      body: GestureDetector(
        onTapDown: (_) {
          setState(() {
            _touched = true;
          });
        },
        onTapUp: (_) {
          setState(() {
            _touched = false;
          });
        },
        onPanUpdate: (drag) {
          if (!_touched) return;
          final deltaX = drag.delta.dx;
          final deltaY = drag.delta.dy;

          setState(() {
            _containerY += deltaY;
            _containerX += deltaX;
          });
        },
        child: Transform.scale(
          scale: _containerScale,
          child: GloballyTranslateStackedWidgets(
            key: _key,
            offset: Offset(_containerX, _containerY),
            children: [
              CustomPaint(
                painter: LineConnector(
                  startPoint: startPoint,
                  destPoint: destPoint,
                  onErrorDraw: (error) {
                    print(error);
                  },
                ),
                child: Container(),
              ),
              ErdTable(
                useCenterOfTableUpdateLocation: true,
                initialXpos: 0,
                initialYpos: 0,
                onDragUpdate: (offset) {
                  setState(() {
                    startPoint = offset;
                  });
                },
              ),
              ErdTable(
                useCenterOfTableUpdateLocation: true,
                initialXpos: 0,
                initialYpos: 0,
                onDragUpdate: (offset) {
                  setState(() {
                    destPoint = offset;
                  });
                },
              ),
            ],
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
    return Stack(
      children: children
          .map(
            (child) => Transform.translate(
              offset: offset,
              child: child,
            ),
          )
          .toList(),
    );
  }
}
