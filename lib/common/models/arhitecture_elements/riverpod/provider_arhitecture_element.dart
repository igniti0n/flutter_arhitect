// import 'package:flutter/widgets.dart';
// import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
// import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
// import 'package:uuid/uuid.dart';

// class ProviderArhitectureElement extends BaseArhitectureElement {
//   ProviderArhitectureElement({
//     required super.dataValue,
//     required super.name,
//     required super.dependencies,
//     required super.methods,
//     required super.widgetsGlobalKey,
//     required super.layer,
//   }) : super(id: const Uuid().v1());

//   factory ProviderArhitectureElement.empty() => ProviderArhitectureElement(
//         widgetsGlobalKey: GlobalKey(),
//         layer: ArhitectureLayer.domain,
//         name: 'Provider',
//         dependencies: [],
//         methods: [],
//         dataValue: '',
//       );
// }
