import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_arhitect/connectable_widget.dart';
import 'package:flutter_arhitect/domain/connecting_widgets_notifier.dart';
import 'package:flutter_arhitect/presentation/painters/user_connecting_line_painter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChooseWidgetsToConnect extends ConsumerWidget {
  const ChooseWidgetsToConnect({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GestureDetector(
        // behavior: HitTestBehavior.deferToChild,
        onPanUpdate: (details) {
          final dx = details.globalPosition.dx;
          final dy = details.globalPosition.dy;
          ref.read(connectingWidgetsNotifier.notifier).updateSecondPointOffset(
                secondPoint: Offset(dx, dy),
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
                    child: _WidgetA(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _WidgetA(),
                      _WidgetA(),
                    ],
                  ),
                  const _PainterWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PainterWidget extends ConsumerWidget {
  const _PainterWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(connectingWidgetsNotifier);

    // log('DRAWING $details');

    return CustomPaint(
      painter: UserConnectingLinePainter(
        startPoint: details.firstPoint,
        endPoint: details.secondPoint,
      ),
    );
  }
}

class _WidgetA extends ConsumerStatefulWidget {
  const _WidgetA();

  @override
  ConsumerState createState() => _WidgetAState();
}

class _WidgetAState extends ConsumerState<_WidgetA> {
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
