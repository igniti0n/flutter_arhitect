// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:uuid/uuid.dart';

class Template {
  final String id;
  final ArhitectureLayer layer;
  final String name;
  final String brickBundleName;

  Template({
    required this.id,
    required this.layer,
    required this.name,
    required this.brickBundleName,
  });

  factory Template.empty() => Template(
        id: const Uuid().v1(),
        layer: ArhitectureLayer.data,
        name: 'unnamed',
        brickBundleName: '',
      );

  BaseArhitectureElement generateArhitectureElement() =>
      BaseArhitectureElement.empty().copyWith(
        brickBundleName: brickBundleName,
        layer: layer,
        name: name,
      );

  Template copyWith({
    ArhitectureLayer? layer,
    String? name,
    String? brickBundleName,
  }) =>
      Template(
        id: id,
        brickBundleName: brickBundleName ?? this.brickBundleName,
        layer: layer ?? this.layer,
        name: name ?? this.name,
      );

  @override
  bool operator ==(covariant Template other) {
    if (identical(this, other)) return true;

    return other.layer == layer && other.name == name && other.id == id;
  }

  @override
  int get hashCode {
    return layer.hashCode ^
        name.hashCode ^
        brickBundleName.hashCode ^
        id.hashCode;
  }
}
