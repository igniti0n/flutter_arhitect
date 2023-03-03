import 'dart:developer';

import 'package:flutter/material.dart';

class UserConnectingLinePainter extends CustomPainter {
  final Offset? startPoint;
  final Offset? endPoint;

  UserConnectingLinePainter({this.startPoint, this.endPoint});

  @override
  void paint(Canvas canvas, Size size) {
    // log('Start point $startPoint, end point $endPoint');
    if (startPoint == null || endPoint == null) {
      //   final paint = Paint()
      //     ..color = Colors.black
      //     ..strokeWidth = 5;
      //   canvas.drawLine(startPoint!, endPoint!, paint);
      return;
    }
    log('PAINTING STUFFFF');

    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 5;
    canvas.drawLine(startPoint ?? const Offset(100, 200),
        endPoint ?? const Offset(300, 300), paint);
  }

  @override
  bool shouldRepaint(UserConnectingLinePainter oldDelegate) =>
      oldDelegate.startPoint != startPoint || oldDelegate.endPoint != endPoint;
}
