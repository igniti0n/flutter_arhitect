import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:uuid/uuid.dart';

class ElementPair extends Equatable {
  final String id = const Uuid().v1();
  final WidgetScreenData first;
  final WidgetScreenData second;

  ElementPair(this.first, this.second);

  @override
  List<Object?> get props => [id, first, second];
}

class WidgetScreenData extends Equatable {
  final Offset position;
  final Size size;
  final BaseArhitectureElement element;

  const WidgetScreenData(
    this.position,
    this.size,
    this.element,
  );

  @override
  List<Object?> get props => [position, size, element];
}
