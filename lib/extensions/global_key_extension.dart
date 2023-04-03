import 'package:flutter/material.dart';

extension GlobalKeyExtension on GlobalKey {
  Offset getPosition() {
    final RenderBox? renderBox =
        currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }

  Size getSize() {
    final RenderBox? renderBox =
        currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size ?? const Size(0, 0);
  }
}
