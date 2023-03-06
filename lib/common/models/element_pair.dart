import 'dart:ui';

import 'package:uuid/uuid.dart';

class ElementPair {
  final String id = const Uuid().v1();
  final WidgetScreenData first;
  final WidgetScreenData second;

  ElementPair(this.first, this.second);
}

class WidgetScreenData {
  final Offset position;
  final Size size;

  WidgetScreenData(
    this.position,
    this.size,
  );
}
