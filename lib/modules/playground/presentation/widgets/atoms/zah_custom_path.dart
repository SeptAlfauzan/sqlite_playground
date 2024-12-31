import 'package:flutter/material.dart';

class ZahCustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width - 50, 0);
    path.lineTo(size.width - 40, size.height / 2);
    path.lineTo(size.width - 50, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
