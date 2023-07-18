// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:mason/mason.dart';
import 'package:uuid/uuid.dart';

class Template extends Equatable {
  final String id;
  final ArhitectureLayer layer;
  final bool hasOutputValue;
  final bool hasMethods;
  final String name;
  final Brick brick;

  const Template({
    required this.id,
    required this.layer,
    required this.name,
    required this.brick,
    required this.hasOutputValue,
    required this.hasMethods,
  });

  factory Template.empty() => Template(
        id: const Uuid().v1(),
        layer: ArhitectureLayer.data,
        name: 'unnamed',
        brick: Brick.path(''),
        hasOutputValue: false,
        hasMethods: false,
      );

  BaseArhitectureElement generateArhitectureElement() =>
      BaseArhitectureElement.empty().copyWith(
        name: name,
        templateName: name,
        layer: layer,
        brick: brick,
        hasOutputValue: hasOutputValue,
        outputValue: '',
        hasMethods: hasMethods,
      );

  Template copyWith({
    ArhitectureLayer? layer,
    String? name,
    Brick? brick,
    bool? hasOutputValue,
  }) =>
      Template(
        id: id,
        layer: layer ?? this.layer,
        name: name ?? this.name,
        brick: brick ?? this.brick,
        hasOutputValue: hasOutputValue ?? this.hasOutputValue,
        hasMethods: hasMethods,
      );

  @override
  List<Object?> get props => [
        id,
        layer,
        name,
        brick,
        hasOutputValue,
      ];
}
