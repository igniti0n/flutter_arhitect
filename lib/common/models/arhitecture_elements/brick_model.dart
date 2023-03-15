// To parse this JSON data, do
//
//     final temperatures = temperaturesFromMap(jsonString);

import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/method.dart';

class BrickModel {
  BrickModel({
    required this.name,
    required this.dependencies,
    required this.methods,
  });

  String name;
  List<Dependency> dependencies;
  List<Method> methods;

  factory BrickModel.fromMap(Map<String, dynamic> json) => BrickModel(
        name: json["name"],
        dependencies: List<Dependency>.from(
            json["dependencies"].map((x) => Dependency.fromMap(x))),
        methods:
            List<Method>.from(json["methods"].map((x) => Method.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "dependencies": List<dynamic>.from(dependencies.map((x) => x.toMap())),
        "methods": List<dynamic>.from(methods.map((x) => x.toMap())),
      };
}

class Dependency {
  Dependency({
    required this.dependencyName,
  });

  String dependencyName;

  factory Dependency.fromMap(Map<String, dynamic> json) => Dependency(
        dependencyName: json["dependencyName"],
      );

  Map<String, dynamic> toMap() => {
        "dependencyName": dependencyName,
      };
}
