import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PositionedDraggableIcon extends ConsumerStatefulWidget {
  final double top;
  final double left;
  final Function()? onChange;

  const PositionedDraggableIcon(
      {super.key, required this.top, required this.left, this.onChange});

  @override
  ConsumerState createState() => _PositionedDraggableIconState();
}

class _PositionedDraggableIconState
    extends ConsumerState<PositionedDraggableIcon> {
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
    // final scaleUpdateDetails = ref.watch(scaleUpdateDetailsStateProvider);

    // final verticalScale = scaleUpdateDetails.verticalScale;
    // final horizontalScale = scaleUpdateDetails.horizontalScale;

    // log('Update: vertical $verticalScale');
    // log('Update: horizontal $horizontalScale');

    return Positioned(
      key: _key,
      top: top,
      left: left,
      child: Draggable(
        feedback: const Icon(Icons.input),
        childWhenDragging: Container(),
        onDragUpdate: (details) =>
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          widget.onChange?.call();
        }),
        onDragEnd: (drag) {
          setState(() {
            top = (drag.offset.dy - yOff); //* verticalScale;
            left = (drag.offset.dx - xOff); // * horizontalScale;
          });
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            widget.onChange?.call();
          });
        },
        child: const Icon(Icons.input),
      ),
    );
  }
}
