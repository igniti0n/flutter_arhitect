// import 'dart:developer' as dev;
// import 'dart:math';

import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/element_pair.dart';

class ElementsConnectionsPainter extends CustomPainter {
  final List<ElementPair> pairs;

  ElementsConnectionsPainter({
    required this.pairs,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final pair in pairs) {
      var first = pair.first;
      var second = pair.second;
      if (second.position.dy < first.position.dy) {
        final temp = first;
        first = second;
        second = temp;
      }

      connectWidgets(
        canvas: canvas,
        size: size,
        widget1Position: first.position,
        widget2Position: second.position,
        widget1Size: first.size,
        widget2Size: second.size,
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
    final linePaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width / 2, 100),
        Offset(size.width / 2, size.height - 100),
        [Colors.red, Colors.blue],
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final firstWidth = widget1Size.width / 2;
    final secondWidth = widget2Size.width / 2;
    final secondHeight = widget2Size.height / 2;

    final firstPositionX = widget1Position.dx;
    final firstPositionY = widget1Position.dy;
    final secondPositionX = widget2Position.dx;
    final secondPositionY = widget2Position.dy;

    /// To adjust the connection point when connecting multiple elements, for elements further away in the X axis, the anchor point should be
    /// further down, so the connection looks more smooth
    final diffX = firstPositionX - secondPositionX;
    // First element
    path.moveTo(
      firstPositionX + firstWidth,
      firstPositionY + widget1Size.height / 2,
    );
    // Draw the circle
    final midpoint = Offset(
      (firstPositionX + firstWidth + secondPositionX + secondWidth) / 2,
      (firstPositionY +
              (widget1Size.height / 2) +
              secondPositionY +
              (widget2Size.height / 2)) /
          2,
    );
    // Center From first elemnt to midpoint
    final firstHalfMid = Offset(
      (firstPositionX + firstWidth + midpoint.dx) / 2,
      (firstPositionY + (widget1Size.height / 2) + midpoint.dy) / 2,
    );
    // Center From midpoint to second element
    final secondHalfMid = Offset(
      (secondPositionX + firstWidth + midpoint.dx) / 2,
      (secondPositionY + (widget1Size.height / 2) + midpoint.dy) / 2,
    );
    path.quadraticBezierTo(
      firstHalfMid.dx + diffX / 5,
      firstHalfMid.dy,
      midpoint.dx,
      midpoint.dy,
    );
    path.quadraticBezierTo(
      secondHalfMid.dx - diffX / 5,
      secondHalfMid.dy,
      secondPositionX + secondWidth,
      secondPositionY + secondHeight,
    );
    canvas.drawPath(path, linePaint);

    final circlePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    const radius = 12.0;
    // Draw the circle X in the middle
    canvas.drawCircle(midpoint, radius, circlePaint);
    const xPadding = 5;
    final xPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2.5;
    canvas.drawLine(
      Offset(midpoint.dx - radius + xPadding, midpoint.dy - radius + xPadding),
      Offset(midpoint.dx + radius - xPadding, midpoint.dy + radius - xPadding),
      xPaint,
    );
    canvas.drawLine(
      Offset(midpoint.dx - radius + xPadding, midpoint.dy + radius - xPadding),
      Offset(midpoint.dx + radius - xPadding, midpoint.dy - radius + xPadding),
      xPaint,
    );
  }

  @override
  bool shouldRepaint(covariant ElementsConnectionsPainter oldDelegate) {
    return oldDelegate.pairs != pairs;
  }
}
