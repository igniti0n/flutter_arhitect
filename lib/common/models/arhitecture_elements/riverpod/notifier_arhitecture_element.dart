import 'package:flutter/widgets.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:uuid/uuid.dart';

class NotifiereArhitectureElement extends BaseArhitectureElement {
  // final List<BaseArhitectureElement> notifierClassDependencies;
  // final List<Method> notifierClassMethods;

  NotifiereArhitectureElement({
    required super.dataValue,
    // required this.notifierClassDependencies,
    // required this.notifierClassMethods,
    required super.name,
    required super.dependencies,
    required super.methods,
    required super.layer,
    required super.widgetsGlobalKey,
  }) : super(id: const Uuid().v1());

  factory NotifiereArhitectureElement.empty() => NotifiereArhitectureElement(
        widgetsGlobalKey: GlobalKey(),
        layer: ArhitectureLayer.domain,
        name: 'Notifier',
        dependencies: [],
        methods: [],
        dataValue: '',
      );
}
