import 'package:flutter/widgets.dart' show GlobalKey;
import 'package:flutter_arhitect/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:uuid/uuid.dart';

class PageArhitectureElement extends BaseArhitectureElement {
  PageArhitectureElement({
    required super.name,
    required super.dependencies,
    required super.methods,
    required super.widgetsGlobalKey,
    required super.layer,
    super.dataValue = '',
  }) : super(id: const Uuid().v1());

  factory PageArhitectureElement.empty() => PageArhitectureElement(
        widgetsGlobalKey: GlobalKey(),
        layer: ArhitectureLayer.presentation,
        name: 'Page',
        dependencies: [],
        methods: [],
        dataValue: '',
      );
}
