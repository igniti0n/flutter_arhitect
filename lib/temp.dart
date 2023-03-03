import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_arhitect/with_list.dart';

GlobalKey widget1Key = GlobalKey();
GlobalKey widget2Key = GlobalKey();

class ConnectWidgets extends StatefulWidget {
  const ConnectWidgets({super.key});

  @override
  _ConnectWidgetsState createState() => _ConnectWidgetsState();
}

class _ConnectWidgetsState extends State<ConnectWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CustomPaint(
              painter: LinePainter(
                widget1Position: getPosition(widget1Key),
                widget2Position: getPosition(widget2Key),
                widget1Size: getSize(widget1Key),
                widget2Size: getSize(widget2Key),
              ),
              child: Container(),
            ),
            Column(
              children: [
                WithList(
                  title: 'TITLE',
                  tempKey: widget1Key,
                  onUpdate: () {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 200,
                ),
                WithList(
                  title: 'SECOND',
                  tempKey: widget2Key,
                  onUpdate: () {
                    setState(() {});
                  },
                ),
                WithList(
                  title: 'SECOND',
                  tempKey: widget2Key,
                  onUpdate: () {
                    setState(() {});
                  },
                ),
                WithList(
                  title: 'SECOND',
                  tempKey: widget2Key,
                  onUpdate: () {
                    setState(() {});
                  },
                ),
              ],
            ),
            // PositionedDraggableIcon(
            //   top: 100,
            //   left: 400,
            //   key: widget1Key,
            //   onChange: () {
            //     setState(() {});
            //   },
            // ),
            // PositionedDraggableIcon(
            //   top: 400,
            //   left: 400,
            //   key: widget2Key,
            //   onChange: () {
            //     setState(() {});
            //   },
            // ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       child: Center(
            //         child: Container(
            //           key: widget1Key,
            //           height: 50,
            //           width: 50,
            //           color: Colors.blue,
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Center(
            //         child: Transform.translate(
            //           offset: const Offset(
            //             60,
            //             100,
            //           ),
            //           child: Container(
            //             key: widget2Key,
            //             height: 50,
            //             width: 100,
            //             color: Colors.green,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  Offset getPosition(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    final position = renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
    log('Position: $position');
    return position;
  }

  Size getSize(GlobalKey key) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    final size = renderBox?.size ?? const Size(0, 0);
    log('Size: $size');
    return size;
  }
}

class LinePainter extends CustomPainter {
  final Offset widget1Position;
  final Offset widget2Position;
  final Size widget1Size;
  final Size widget2Size;

  LinePainter({
    required this.widget1Position,
    required this.widget2Position,
    required this.widget1Size,
    required this.widget2Size,
  });

    final linePaint = Paint()
      ..color = Colors.deepPurpleAccent[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

  @override
  void paint(Canvas canvas, Size size) {
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
  bool shouldRepaint(covariant LinePainter oldDelegate) {
    return oldDelegate.widget1Position != widget1Position ||
        oldDelegate.widget2Position != widget2Position;
  }
}
