import 'package:flutter/material.dart';

class ConnectableWidget extends StatelessWidget {
  final Function(TapDownDetails details, Offset widgetPosition, Size size)
      onTapDown;
  final Function(TapUpDetails details, Offset widgetPosition, Size size)
      onTapUp;
  final Widget child;
  final globalKey = GlobalKey();

  ConnectableWidget({
    super.key,
    required this.onTapDown,
    required this.onTapUp,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      key: globalKey,
      child: GestureDetector(
        onTapDown: (details) => onTapDown(details, getPosition(), getSize()),
        onTapUp: (details) => onTapUp(details, getPosition(), getSize()),
        child: child,
      ),
    );
  }

  Offset getPosition() {
    final RenderBox? renderBox =
        globalKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }

  Size getSize() {
    final RenderBox? renderBox =
        globalKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size ?? const Size(0, 0);
  }
}
