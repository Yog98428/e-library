import 'package:flutter/material.dart';

class DiagonalClipper extends CustomClipper<Path> {
  DiagonalClipper(this.clipHeight, this.axis);

  ///The height that the diagonal angle sees
  final double clipHeight;

  ///The direction of the diagonal
  final Axis axis;

  @override
  Path getClip(Size size) {
    var path = Path();
    if (axis == Axis.horizontal) {
      path.lineTo(0.0, size.height);
      path.lineTo(size.width, size.height - clipHeight);
      path.lineTo(size.width, 0.0);
    } else {
      path.moveTo(0.0, size.height);
      path.lineTo(clipHeight, 0.0);
      path.lineTo(size.width, 0.0);
      path.lineTo(size.width, size.height);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
