import 'package:flutter/material.dart';
import 'package:sql_playground/ui/colors.dart';

class ErdTable extends StatefulWidget {
  final double initialXpos;
  final double initialYpos;
  final Function(Offset offset)? onDragUpdate;
  const ErdTable({
    super.key,
    required this.initialXpos,
    required this.initialYpos,
    this.onDragUpdate,
  });

  @override
  State<ErdTable> createState() => _ErdTableState();
}

class _ErdTableState extends State<ErdTable> {
  bool _touched = false;
  double _xPos = 0;
  double _yPos = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _xPos = widget.initialXpos;
      _yPos = widget.initialYpos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _xPos,
      top: _yPos,
      child: GestureDetector(
        onTapDown: (idk) {
          setState(() {
            _touched = true;
          });
        },
        onTapUp: (idk) {
          setState(() {
            _touched = false;
          });
        },
        onPanUpdate: (drag) {
          if (!_touched) return;
          final deltaX = drag.delta.dx;
          final deltaY = drag.delta.dy;

          setState(() {
            _yPos += deltaY;
            _xPos += deltaX;
          });

          if (widget.onDragUpdate != null) {
            widget.onDragUpdate!(Offset(_xPos, _yPos));
          }
        },
        child: Container(
          color: AppColors.orange,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
