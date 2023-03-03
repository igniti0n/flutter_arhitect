import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_arhitect/connecting_widgets_notifier.dart';
import 'package:flutter_arhitect/widget_with_global_key.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseWidgetsToConnect extends ConsumerWidget {
  const ChooseWidgetsToConnect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GestureDetector(
        // behavior: HitTestBehavior.deferToChild,
        onPanUpdate: (details) {
          final x = details.globalPosition.dx;
          final y = details.globalPosition.dy;
          ref.read(connectingWidgetsNotifier.notifier).updateSecondPointOffset(
                secondPoint: Offset(x, y),
              );
        },

        child: SafeArea(
          child: Center(
            child: SizedBox.expand(
              child: Stack(
                // fit: StackFit.expand,
                children: [
                  GestureDetector(
                    onTapUp: (details) {
                      log('END GENERAL');
                      ref.read(connectingWidgetsNotifier.notifier).reset();
                    },
                    child: const SizedBox.expand(),
                  ),
                  const Positioned(
                    bottom: 400,
                    right: 800,
                    child: WidgetA(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      WidgetA(),
                      WidgetA(),
                    ],
                  ),
                  const PainterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PainterWidget extends ConsumerWidget {
  const PainterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(connectingWidgetsNotifier);

    // log('DRAWING $details');

    return CustomPaint(
      painter: LinePainter(
        startPoint: details.firstPoint,
        endPoint: details.secondPoint,
      ),
    );
  }
}

class WidgetA extends ConsumerStatefulWidget {
  const WidgetA({super.key});

  @override
  ConsumerState createState() => _WidgetAState();
}

class _WidgetAState extends ConsumerState<WidgetA> {
  bool _isConnecting = false;
  Offset? _startPoint;

  void _onPressed() {
    setState(() {
      _isConnecting = true;
      _startPoint = Offset.zero; // set initial value to prevent null error
    });
  }

  void _onHover(Offset endPoint) {
    if (_isConnecting) {
      setState(() {
        _startPoint = endPoint;
      });
    }
  }

  void _onRelease() {
    if (_isConnecting) {
      setState(() {
        _isConnecting = false;
        _startPoint = null; // reset start point
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConnectableWidget(
      onTapDown: (details, position, size) {
        ref.read(connectingWidgetsNotifier.notifier).reset();
        ref
            .read(connectingWidgetsNotifier.notifier)
            .updateFirstPointOffset(firstPoint: details.globalPosition);
      },
      onTapUp: (details, position, size) {
        log('ON TAP UP!');
        if (!_isConnecting) {
          ref
              .read(connectingWidgetsNotifier.notifier)
              .updateSecondPointOffset(secondPoint: position);
          return;
        }

        setState(() {
          _isConnecting = false;
          ref.read(connectingWidgetsNotifier.notifier).reset();
        });
      },
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final Offset? startPoint;
  final Offset? endPoint;

  LinePainter({this.startPoint, this.endPoint});

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

    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5;
    canvas.drawLine(startPoint ?? const Offset(100, 200),
        endPoint ?? const Offset(300, 300), paint);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) =>
      oldDelegate.startPoint != startPoint || oldDelegate.endPoint != endPoint;
}
