import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/method_parameter.dart';

class Method {
  Method({
    required this.methodName,
    required this.type,
    required this.parameters,
  });

  String methodName;
  String type;
  List<Parameter> parameters;

  factory Method.fromMap(Map<String, dynamic> json) => Method(
        methodName: json["methodName"],
        type: json["type"],
        parameters: List<Parameter>.from(
            json["parameters"].map((x) => Parameter.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "methodName": methodName,
        "type": type,
        "parameters": List<dynamic>.from(parameters.map((x) => x.toMap())),
      };
}
