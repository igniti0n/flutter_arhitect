// import 'package:flutter/widgets.dart';
// import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
// import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
// import 'package:uuid/uuid.dart';

// class RepositoryArhitectureElement extends BaseArhitectureElement {
//   RepositoryArhitectureElement({
//     required super.name,
//     required super.dependencies,
//     required super.methods,
//     required super.widgetsGlobalKey,
//     required super.layer,
//     super.dataValue = '',
//   }) : super(id: const Uuid().v1());

//   factory RepositoryArhitectureElement.empty() => RepositoryArhitectureElement(
//         widgetsGlobalKey: GlobalKey(),
//         layer: ArhitectureLayer.data,
//         name: 'Repository',
//         dependencies: [],
//         methods: [],
//         dataValue: '',
//       );
// }
// // 