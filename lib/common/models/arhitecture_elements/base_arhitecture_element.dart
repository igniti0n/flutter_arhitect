// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/brick_model.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/method.dart';
import 'package:flutter_arhitect/presentation/widgets/methods_and_parameters_form/method_form_row.dart';
import 'package:flutter_arhitect/presentation/widgets/methods_and_parameters_form/parameter_form_row.dart';
import 'package:mason/mason.dart';
import 'package:uuid/uuid.dart';

class BaseArhitectureElement extends Equatable {
  final String id;
  final GlobalKey widgetsGlobalKey;
  final ArhitectureLayer layer;
  final String name;
  final String description;
  final List<BaseArhitectureElement> dependencies;
  final List<Method> methods;
  final String dataValue;
  final Offset canvasPosition;
  final Brick brick;

  const BaseArhitectureElement({
    required this.id,
    required this.widgetsGlobalKey,
    required this.layer,
    required this.name,
    required this.description,
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
        description: '',
        dependencies: const [],
        methods: const [],
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

  List<Tuple2<Widget, List<Widget>>> get methodsAndParametersWidgetList {
    final methodsAndParameters = <Tuple2<Widget, List<Widget>>>[];
    for (final method in methods) {
      final methodKey = ValueKey(const Uuid().v4());
      final parametersWidgetList = <Widget>[];
      for (final parameter in method.parameters) {
        parametersWidgetList.add(ParameterFormRow(
          methodKey: methodKey,
          parameterKey: ValueKey(const Uuid().v4()),
          parameter: parameter,
        ));
      }
      methodsAndParameters.add(Tuple2(
        MethodFormRow(methodKey: methodKey, method: method),
        parametersWidgetList,
      ));
    }
    return methodsAndParameters;
  }

  BaseArhitectureElement copyWith({
    GlobalKey? widgetsGlobalKey,
    ArhitectureLayer? layer,
    String? name,
    String? description,
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
        description: description ?? this.description,
        widgetsGlobalKey: widgetsGlobalKey ?? this.widgetsGlobalKey,
        canvasPosition: canvasPosition ?? this.canvasPosition,
      );

  @override
  List<Object?> get props => [
        id,
        widgetsGlobalKey,
        layer,
        name,
        description,
        dependencies,
        methods,
        dataValue,
        canvasPosition,
        brick,
      ];
}
