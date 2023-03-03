import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_arhitect/models/element_pair.dart';

class ElementsConnectionsPainter extends CustomPainter {
  final List<ElementPair> pairs;

  ElementsConnectionsPainter({
    required this.pairs,
  });

  final linePaint = Paint()
    ..color = Colors.deepPurpleAccent[100]!
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4;

  @override
  void paint(Canvas canvas, Size size) {
    for (var pair in pairs) {
      connectWidgets(
        canvas: canvas,
        size: size,
        widget1Position: pair.first.position,
        widget2Position: pair.second.position,
        widget1Size: pair.first.size,
        widget2Size: pair.second.size,
      );
    }
  }

  void connectWidgets({
    required Canvas canvas,
    required Size size,
    required Offset widget1Position,
    required Offset widget2Position,
    required Size widget1Size,
    required Size widget2Size,
  }) {
    final path = Path();
    final anchorHeight = widget1Size.height + 10;
    final firstWidth = widget1Size.width / 2;
    final firstHeight = anchorHeight + 20;
    final secondWidth = widget2Size.width / 2;
    final secondHeight = widget2Size.height / 2;
    log('Move to: ${widget1Position.dx} - ${widget1Position.dy}');
    log('Move to: ${widget2Position.dx} - ${widget2Position.dy}');

    // canvas.drawCircle(const Offset(40, 40), 60, paint);
    // Move to the center of widget1
    path.moveTo(
      widget1Position.dx + firstWidth,
      widget1Position.dy + widget1Size.height / 2,
    );

    path.lineTo(
      widget1Position.dx + firstWidth,
      widget1Position.dy + anchorHeight,
    );

    // Draw horizontal line to the same Y coordinate as widget2
    path.lineTo(
      widget2Position.dx + secondWidth,
      widget1Position.dy + anchorHeight + 20,
    );

    // Draw horizontal line to the same Y coordinate as widget2
    path.lineTo(
      widget2Position.dx + secondWidth,
      widget1Position.dy + firstHeight,
    );

    // Draw vertical line to the center of widget2
    path.lineTo(
        widget2Position.dx + secondWidth, widget2Position.dy + secondHeight);

    canvas.drawPath(
      path,
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant ElementsConnectionsPainter oldDelegate) {
    return oldDelegate.pairs != pairs;
  }
}
