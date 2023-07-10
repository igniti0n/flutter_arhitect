// To parse this JSON data, do
//
//     final temperatures = temperaturesFromMap(jsonString);

import 'package:equatable/equatable.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/method.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class BrickModel extends Equatable {
  final String name;
  final List<Dependency> dependencies;
  final List<Method> methods;
  final String description;

  const BrickModel({
    required this.name,
    required this.dependencies,
    required this.methods,
    required this.description,
  });

  factory BrickModel.fromMap(Map<String, dynamic> json) => BrickModel(
        name: json['name'],
        description: json['description'],
        dependencies: List<Dependency>.from(
          json['dependencies'].map((x) => Dependency.fromMap(x)),
        ),
        methods:
            List<Method>.from(json['methods'].map((x) => Method.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'description': description,
        'dependencies': List.from(dependencies.map((x) => x.toMap())),
        'methods': List.from(methods.map((x) => x.toMap())),
      };
  @override
  List<Object?> get props => [name, dependencies, methods];
}

@JsonSerializable()
class Dependency extends Equatable {
  final String dependencyName;

  const Dependency({
    required this.dependencyName,
  });

  factory Dependency.fromMap(Map<String, dynamic> json) => Dependency(
        dependencyName: json['dependencyName'],
      );

  Map<String, dynamic> toMap() => {
        'dependencyName': dependencyName,
      };

  @override
  List<Object?> get props => [dependencyName];
}
