import 'package:flutter/widgets.dart';
import 'package:sql_playground/ui/colors.dart';

class LineConnector extends CustomPainter {
  final Offset startPoint;
  final Offset destPoint;
  final Function(String error) onErrorDraw;

  LineConnector(
      {required this.startPoint,
      required this.destPoint,
      required this.onErrorDraw});

  @override
  void paint(Canvas canvas, Size size) {
    try {
      final paint = Paint()
        ..color = AppColors.grey
        ..strokeWidth = 4.0;
      final firstPoint = startPoint;
      final lastPoint = destPoint;
      final secondPoint = Offset(lastPoint.dx / 1.5, firstPoint.dy);
      final thirdPoint = Offset(lastPoint.dx / 1.5, lastPoint.dy);

      canvas.drawLine(firstPoint, secondPoint, paint);
      canvas.drawLine(secondPoint, thirdPoint, paint);
      canvas.drawLine(thirdPoint, lastPoint, paint);
    } catch (e) {
      onErrorDraw(e.toString());
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
