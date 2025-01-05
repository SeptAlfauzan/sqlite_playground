import 'package:flutter/material.dart';
import 'package:sql_playground/modules/erd/domain/dto/database_schema.dart';
import 'package:sql_playground/ui/colors.dart';

class ErdTable extends StatefulWidget {
  final double initialXpos;
  final double initialYpos;
  final Function(Offset offset)? onDragUpdate;
  final bool useCenterOfTableUpdateLocation;
  final TableInfo tableInfo;

  final Function(Size size)? onLoadBoxSize;
  const ErdTable({
    super.key,
    required this.tableInfo,
    required this.initialXpos,
    required this.initialYpos,
    this.onDragUpdate,
    this.onLoadBoxSize,
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
  Size _widgetSize = const Size(0, 0);

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_key.currentContext == null) return;
      final box = _key.currentContext!.findRenderObject() as RenderBox;
      setState(() {
        _widgetSize = box.size;
      });

      if (widget.onLoadBoxSize != null) {
        widget.onLoadBoxSize!(box.size);
      }
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
            decoration: const BoxDecoration(
                color: AppColors.grey,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(8))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.table_view),
                      const SizedBox(
                        width: 32,
                      ),
                      Text(widget.tableInfo.tableName),
                    ],
                  ),
                ),
                Container(
                  color: AppColors.darkerGrey,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('PK')),
                      DataColumn(label: Text('Column')),
                      DataColumn(label: Text('DataType')),
                    ],
                    rows: [
                      ...widget.tableInfo.columns.map(
                        (column) => DataRow(
                          cells: [
                            DataCell(
                              column.primaryKey == 1
                                  ? const Icon(Icons.key)
                                  : const SizedBox.shrink(),
                            ),
                            DataCell(
                              Text(column.name),
                            ),
                            DataCell(
                              Text(column.type),
                            ),
                          ],
                        ),
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
