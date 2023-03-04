// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class BaseArhitectureElement {
  final String id;
  final GlobalKey widgetsGlobalKey;
  final ArhitectureLayer layer;
  final String name;
  final List<BaseArhitectureElement> dependencies;
  final List<Method> methods;
  final String dataValue;
  final Offset canvasPosition;

  BaseArhitectureElement({
    required this.widgetsGlobalKey,
    required this.layer,
    required this.name,
    required this.dependencies,
    required this.methods,
    required this.dataValue,
    required this.id,
    this.canvasPosition = const Offset(100, 100),
  });

  BaseArhitectureElement copyWith({
    GlobalKey? widgetsGlobalKey,
    ArhitectureLayer? layer,
    String? name,
    List<BaseArhitectureElement>? dependencies,
    List<Method>? methods,
    String? dataValue,
    Offset? canvasPosition,
  }) =>
      BaseArhitectureElement(
        dataValue: dataValue ?? this.dataValue,
        dependencies: dependencies ?? this.dependencies,
        layer: layer ?? this.layer,
        methods: methods ?? this.methods,
        name: name ?? this.name,
        widgetsGlobalKey: widgetsGlobalKey ?? this.widgetsGlobalKey,
        canvasPosition: canvasPosition ?? this.canvasPosition,
        id: id,
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
    return 'BaseArhitectureElement(widgetsGlobalKey: $widgetsGlobalKey, layer: $layer, name: $name, dependencies: $dependencies, methods: $methods, dataValue: $dataValue)';
  }
}

class Method {
  final String name;
  final String returnType;
  final List<Method> parameters;

  Method(
      {required this.name, required this.returnType, required this.parameters});
}

class MethodParameter {
  final String name;
  final String returnType;

  MethodParameter({required this.name, required this.returnType});
}

enum ArhitectureLayer {
  data,
  domain,
  presentation,
}
