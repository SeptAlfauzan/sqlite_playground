import 'package:flutter/material.dart';
import 'package:sql_playground/modules/erd/presentation/widgets/atoms/erd_table.dart';
import 'package:sql_playground/modules/erd/presentation/widgets/atoms/line_connector.dart';

class ErdView extends StatefulWidget {
  const ErdView({super.key});

  @override
  State<ErdView> createState() => _ErdViewState();
}

class _ErdViewState extends State<ErdView> {
  Offset startPoint = const Offset(0, 0);
  Offset destPoint = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
            initialXpos: 0,
            initialYpos: 0,
            onDragUpdate: (offset) {
              setState(() {
                startPoint = offset;
              });
            },
          ),
          ErdTable(
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
    );
  }
}
