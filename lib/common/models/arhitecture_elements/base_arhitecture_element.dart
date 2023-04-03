// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/brick_model.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/method.dart';
import 'package:mason/mason.dart';
import 'package:uuid/uuid.dart';

class BaseArhitectureElement {
  final String id;
  final GlobalKey widgetsGlobalKey;
  final ArhitectureLayer layer;
  final String name;
  final List<BaseArhitectureElement> dependencies;
  final List<Method> methods;
  final String dataValue;
  final Offset canvasPosition;
  final Brick brick;

  BaseArhitectureElement({
    required this.id,
    required this.widgetsGlobalKey,
    required this.layer,
    required this.name,
    required this.dependencies,
    required this.methods,
    required this.dataValue,
    required this.brick,
    this.canvasPosition = const Offset(100, 100),
  });

  factory BaseArhitectureElement.empty() => BaseArhitectureElement(
        id: const Uuid().v1(),
        widgetsGlobalKey: GlobalKey(),
        layer: ArhitectureLayer.data,
        name: 'unnamed',
        dependencies: [],
        methods: [],
        dataValue: '',
        brick: Brick.path(''),
      );

  BrickModel toBrickModel() => BrickModel(
        name: name,
        dependencies: dependencies
            .map((dependency) => Dependency(dependencyName: dependency.name))
            .toList(),
        methods: methods,
      );

  BaseArhitectureElement copyWith({
    GlobalKey? widgetsGlobalKey,
    ArhitectureLayer? layer,
    String? name,
    List<BaseArhitectureElement>? dependencies,
    List<Method>? methods,
    String? dataValue,
    Offset? canvasPosition,
    Brick? brick,
  }) =>
      BaseArhitectureElement(
        id: id,
        brick: brick ?? this.brick,
        dataValue: dataValue ?? this.dataValue,
        dependencies: dependencies ?? this.dependencies,
        layer: layer ?? this.layer,
        methods: methods ?? this.methods,
        name: name ?? this.name,
        widgetsGlobalKey: widgetsGlobalKey ?? this.widgetsGlobalKey,
        canvasPosition: canvasPosition ?? this.canvasPosition,
      );

  @override
  bool operator ==(covariant BaseArhitectureElement other) {
    if (identical(this, other)) return true;

    return other.widgetsGlobalKey == widgetsGlobalKey &&
        other.layer == layer &&
        other.name == name &&
        listEquals(other.dependencies, dependencies) &&
        listEquals(other.methods, methods) &&
        other.dataValue == dataValue;
  }

  @override
  int get hashCode {
    return widgetsGlobalKey.hashCode ^
        layer.hashCode ^
        name.hashCode ^
        dependencies.hashCode ^
        methods.hashCode ^
        dataValue.hashCode;
  }

  @override
  String toString() {
    return 'BaseArhitectureElement(widgetsGlobalKey: $widgetsGlobalKey, layer: $layer, name: $name, dependencies: $dependencies, methods: ${methods.fold('', (previousValue, element) => '$previousValue\n $element')})}, dataValue: $dataValue)';
  }
}
