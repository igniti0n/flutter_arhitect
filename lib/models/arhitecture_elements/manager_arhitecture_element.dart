import 'package:flutter/widgets.dart';
import 'package:flutter_arhitect/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:uuid/uuid.dart';

class ManagerArhitectureElement extends BaseArhitectureElement {
  ManagerArhitectureElement({
    required super.name,
    required super.dependencies,
    required super.layer,
    required super.methods,
    required super.widgetsGlobalKey,
    super.dataValue = '',
  }) : super(id: const Uuid().v1());

  factory ManagerArhitectureElement.empty() => ManagerArhitectureElement(
        widgetsGlobalKey: GlobalKey(),
        layer: ArhitectureLayer.data,
        name: 'Manager',
        dependencies: [],
        methods: [],
        dataValue: '',
      );
}
