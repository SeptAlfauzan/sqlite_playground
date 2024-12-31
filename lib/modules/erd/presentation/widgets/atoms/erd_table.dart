import 'package:flutter/material.dart';
import 'package:sql_playground/modules/playground/presentation/widgets/atoms/datatable.dart';
import 'package:sql_playground/ui/colors.dart';
import 'package:sql_playground/ui/theme.dart';

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
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: AppColors.grey,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadiusDirectional.all(Radius.circular(8))),
          child: Column(
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
    );
  }
}
