import 'package:flutter/material.dart';
import 'dart:math' as math;

class ButtomPainter extends CustomPainter {
  final double width;
  final double seepAngleSecond;

  ButtomPainter({
    @required this.width,
    @required this.seepAngleSecond,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCenter(
      center: Offset(width / 2, width / 2),
      width: width,
      height: width,
    ); // .fromLTRB(50, 100, 250, 200);
    var startAngle = -math.pi / 2;
    var sweepAngle = math.pi * 2;
    var useCenter = false;
    var paint = Paint()
      ..color = Color(0xffFFE07F)
      // ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);

    startAngle = 90 * math.pi / 180;
    sweepAngle = seepAngleSecond;
    useCenter = false;
    final paint2 = Paint()
      ..color = Color(0xff263238)
      // ..color = Color(0xff263238)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
