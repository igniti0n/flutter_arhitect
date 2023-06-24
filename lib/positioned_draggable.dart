import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PositionedDraggable extends ConsumerStatefulWidget {
  final double top;
  final double left;
  final Widget child;
  final Function(Offset offset)? onChange;

  const PositionedDraggable({
    super.key,
    required this.child,
    required this.top,
    required this.left,
    this.onChange,
  });

  @override
  ConsumerState createState() => _PositionedDraggablenState();
}

class _PositionedDraggablenState extends ConsumerState<PositionedDraggable> {
  final GlobalKey _key = GlobalKey();
  late double top, left;
  late double xOff, yOff;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    top = widget.top;
    left = widget.left;
    super.initState();
  }

  void _getRenderOffsets() {
    final RenderBox? renderBoxWidget =
        _key.currentContext?.findRenderObject() as RenderBox?;
    final offset = renderBoxWidget?.localToGlobal(Offset.zero) ?? Offset.zero;

    yOff = offset.dy - top;
    xOff = offset.dx - left;
  }

  void _afterLayout(_) {
    _getRenderOffsets();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: _key,
      top: top,
      left: left,
      child: Draggable(
        feedback: Material(
          color: Colors.transparent,
          child: widget.child,
        ),
        childWhenDragging: Container(),
        onDragUpdate: (details) =>
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          widget.onChange?.call(details.globalPosition);
        }),
        onDragEnd: (drag) {
          setState(() {
            top = (drag.offset.dy - yOff); //* verticalScale;
            left = (drag.offset.dx - xOff); // * horizontalScale;
          });
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            widget.onChange?.call(drag.offset);
          });
        },
        child: widget.child,
      ),
    );
  }
}
