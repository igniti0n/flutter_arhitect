import 'package:flutter/material.dart';

class UserConnectingLinePainter extends CustomPainter {
  final Offset? startPoint;
  final Offset? endPoint;

  UserConnectingLinePainter({this.startPoint, this.endPoint});

  @override
  void paint(Canvas canvas, Size size) {
    if (startPoint == null || endPoint == null) {
      return;
    }

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 5;
    canvas.drawLine(
      startPoint ?? const Offset(100, 200),
      endPoint ?? const Offset(300, 300),
      paint,
    );
  }

  @override
  bool shouldRepaint(UserConnectingLinePainter oldDelegate) =>
      oldDelegate.startPoint != startPoint || oldDelegate.endPoint != endPoint;
}
