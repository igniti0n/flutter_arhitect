// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:mason/mason.dart';
import 'package:uuid/uuid.dart';

class Template extends Equatable {
  final String id;
  final ArhitectureLayer layer;
  final String name;
  final Brick brick;

  const Template({
    required this.id,
    required this.layer,
    required this.name,
    required this.brick,
  });

  factory Template.empty() => Template(
        id: const Uuid().v1(),
        layer: ArhitectureLayer.data,
        name: 'unnamed',
        brick: Brick.path(''),
      );

  BaseArhitectureElement generateArhitectureElement() =>
      BaseArhitectureElement.empty()
          .copyWith(layer: layer, name: name, brick: brick);

  Template copyWith({
    ArhitectureLayer? layer,
    String? name,
    Brick? brick,
  }) =>
      Template(
        id: id,
        layer: layer ?? this.layer,
        name: name ?? this.name,
        brick: brick ?? this.brick,
      );

  @override
  List<Object?> get props => [
        id,
        layer,
        name,
        brick,
      ];
}
