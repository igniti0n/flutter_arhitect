import 'dart:developer';

import 'package:flutter/material.dart';

extension WidgetScreenInfo on GlobalKey {
  Offset getPosition() {
    final RenderBox? renderBox =
        currentContext?.findRenderObject() as RenderBox?;
    final position = renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
    log('Position: $position');
    return position;
  }

  Size getSize() {
    final RenderBox? renderBox =
        currentContext?.findRenderObject() as RenderBox?;
    final size = renderBox?.size ?? const Size(0, 0);
    log('Size: $size');
    return size;
  }
}
