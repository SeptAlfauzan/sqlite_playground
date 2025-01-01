import 'package:flutter/material.dart';
import 'package:sql_playground/ui/colors.dart';

class ErdTable extends StatefulWidget {
  final double initialXpos;
  final double initialYpos;
  final Function(Offset offset)? onDragUpdate;
  final bool useCenterOfTableUpdateLocation;
  const ErdTable({
    super.key,
    required this.initialXpos,
    required this.initialYpos,
    this.onDragUpdate,
    this.useCenterOfTableUpdateLocation = false,
  });

  @override
  State<ErdTable> createState() => _ErdTableState();
}

class _ErdTableState extends State<ErdTable> {
  final _key = GlobalKey();
  bool _touched = false;
  double _xPos = 0;
  double _yPos = 0;
  Size _widgetSize = Size(0, 0);

  @override
  void initState() {
    setState(() {
      _xPos = widget.initialXpos;
      _yPos = widget.initialYpos;
    });
    getWidgetSize();
    super.initState();
  }

  void getWidgetSize() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (_key.currentContext == null) return;
      final box = _key.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        _widgetSize = box.size;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_xPos, _yPos),
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
            widget.useCenterOfTableUpdateLocation
                ? widget.onDragUpdate!(
                    Offset(_xPos + (_widgetSize.width / 2),
                        _yPos + (_widgetSize.height / 2)),
                  )
                : widget.onDragUpdate!(
                    Offset(_xPos, _yPos),
                  );
          }
        },
        child: IntrinsicWidth(
          child: Container(
            key: _key,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: AppColors.grey,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(8))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    children: [
                      Icon(Icons.table_view),
                      const SizedBox(
                        width: 32,
                      ),
                      Text("Table Name"),
                    ],
                  ),
                ),
                Container(
                  color: AppColors.darkerGrey,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('PK')),
                      DataColumn(label: Text('Column')),
                      DataColumn(label: Text('DataType')),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(
                            Icon(Icons.key),
                          ),
                          DataCell(
                            Text('id'),
                          ),
                          DataCell(
                            Text('TEXT'),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            const SizedBox.shrink(),
                          ),
                          DataCell(
                            Text('name'),
                          ),
                          DataCell(
                            Text('TEXT'),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: [
                          DataCell(
                            const SizedBox.shrink(),
                          ),
                          DataCell(
                            Text('age'),
                          ),
                          DataCell(
                            Text('INTEGER'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
