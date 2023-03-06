// import 'dart:developer' as dev;
// import 'dart:math';

import 'dart:developer';
import 'dart:math' as math;
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
    for (var pair in pairs) {
      var first = pair.first.position;
      var second = pair.second.position;
      if (second.dy < first.dy) {
        final temp = first;
        first = second;
        second = temp;
      }

      connectWidgets(
        canvas: canvas,
        size: size,
        widget1Position: first,
        widget2Position: second,
        widget1Size: pair.first.size,
        widget2Size: pair.second.size,
      );
    }
  }

  // void connectWidgets({
  //   required Canvas canvas,
  //   required Size size,
  //   required Offset widget1Position,
  //   required Offset widget2Position,
  //   required Size widget1Size,
  //   required Size widget2Size,
  // }) {
  //   final path = Path();
  //   final anchorHeight = widget1Size.height + 10;
  //   final firstWidth = widget1Size.width / 2;
  //   final firstHeight = anchorHeight + 20;
  //   final secondWidth = widget2Size.width / 2;
  //   final secondHeight = widget2Size.height / 2;

  //   final firstPositionX = widget1Position.dx;
  //   final firstPositionY = widget1Position.dy;
  //   final secondPositionX = widget2Position.dx;
  //   final secondPositionY = widget2Position.dy;

  //   // log('Move to: $firstPositionX - $firstPositionY');
  //   // log('Move to: $secondPositionX - $secondPositionY');

  //   // // canvas.drawCircle(const Offset(40, 40), 60, paint);
  //   // // Move to the center of widget1
  //   // path.moveTo(
  //   //   firstPositionX + firstWidth,
  //   //   firstPositionY + widget1Size.height / 2,
  //   // );

  //   // path.lineTo(
  //   //   firstPositionX + firstWidth,
  //   //   firstPositionY + anchorHeight,
  //   // );

  //   path.moveTo(
  //     firstPositionX + firstWidth,
  //     firstPositionY + widget1Size.height / 2,
  //   );

  //   // Draw horizontal line to the same Y coordinate as widget2
  //   // path.quadraticBezierTo(
  //   //   secondPositionX + secondWidth + 20,
  //   //   firstPositionY + anchorHeight + 20,
  //   //   secondPositionX + secondWidth,
  //   //   firstPositionY + anchorHeight,
  //   // );

  //   // // Draw horizontal line to the same Y coordinate as widget2
  //   // path.quadraticBezierTo(
  //   //   secondPositionX + secondWidth - 40,
  //   //   firstPositionY + firstHeight - 40,
  //   //   secondPositionX + secondWidth,
  //   //   firstPositionY + firstHeight,
  //   // );

  //   var diffX = (firstPositionX + firstWidth) - (secondPositionX + secondWidth);
  //   diffX = min(diffX.abs() / 4, 60);
  //   double diffY = (firstPositionY + firstHeight / 2) -
  //       (secondPositionY + secondHeight / 2);
  //   diffY = min(diffY.abs() / 2.4, 20);

  //   dev.log('Diff Y: $diffY');

  //   canvas.drawCircle(
  //       Offset(
  //         firstPositionX + firstWidth,
  //         firstPositionY + widget1Size.height / 2,
  //       ),
  //       10,
  //       linePaint);

  //   // Draw vertical line to the center of widget2
  //   path.cubicTo(
  //     firstPositionX + firstWidth - diffX * (diffY / 10),
  //     firstPositionY + firstHeight / 2, // - diffY,
  //     secondPositionX + secondWidth + diffX * (diffY / 10),
  //     (secondPositionY + secondHeight / 2), // + diffY),
  //     (secondPositionX + secondWidth),
  //     (secondPositionY + secondHeight),
  //   );

  //   canvas.drawPath(
  //     path,
  //     linePaint,
  //   );

  //   final circlePaint = Paint()..color = Colors.red[800]!;

  //   canvas.drawCircle(
  //       Offset(
  //         firstPositionX + firstWidth - diffX * (diffY / 10),
  //         firstPositionY + firstHeight, // -
  //       ),
  //       20,
  //       circlePaint);

  //   canvas.drawCircle(
  //       Offset(
  //         secondPositionX + secondWidth + diffX * (diffY / 10),
  //         (secondPositionY + secondHeight),
  //       ),
  //       20,
  //       circlePaint);

  //   canvas.drawCircle(
  //       Offset(
  //         (secondPositionX + secondWidth), // - diffX),
  //         (secondPositionY + secondHeight), //
  //       ),
  //       20,
  //       circlePaint);
  // }

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
      // ..color = Colors.deepPurpleAccent[100]!
      ..shader = ui.Gradient.linear(
        Offset(size.width / 2, 100),
        Offset(size.width / 2, size.height - 100),
        [Colors.red, Colors.blue],
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final anchorHeight = widget1Size.height / 1;
    final firstWidth = widget1Size.width / 2;
    final firstHeight = anchorHeight + 20;
    final secondWidth = widget2Size.width / 2;
    final secondHeight = widget2Size.height / 2;

    final firstPositionX = widget1Position.dx;
    final firstPositionY = widget1Position.dy;
    final secondPositionX = widget2Position.dx;
    final secondPositionY = widget2Position.dy;

    /// To adjust the connection point when connecting multiple elements, for elements further away in the X axis, the anchor point should be
    /// further down, so the connection looks more smooth
    final diffX = firstPositionX - secondPositionX;
    final addedOffsetToAnchorY = diffX.abs() / 9; //math.min(diffX / 10, 20);
    log('Diff X: $diffX');

    // First element
    path.moveTo(
      firstPositionX + firstWidth,
      firstPositionY + widget1Size.height / 2,
    );

    // Connection (anchor)
    path.lineTo(
      secondPositionX + secondWidth,
      math.min(
        secondPositionY + secondHeight,
        firstPositionY + anchorHeight + addedOffsetToAnchorY,
      ),
    );

    // Second element
    path.lineTo(
      secondPositionX + secondWidth,
      secondPositionY + secondHeight,
    );

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
