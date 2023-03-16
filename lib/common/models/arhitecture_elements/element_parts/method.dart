import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/method_parameter.dart';
import 'package:uuid/uuid.dart';

class Method {
  Method({
    required this.id,
    required this.methodName,
    required this.returnValue,
    required this.parameters,
  });
  final String id;
  String methodName;
  String returnValue;
  List<Parameter> parameters;

  factory Method.defaultMethod() => Method(
        id: const Uuid().v1(),
        methodName: 'methodName',
        returnValue: 'void',
        parameters: [],
      );

  factory Method.fromMap(Map<String, dynamic> json) => Method(
        id: json["id"],
        methodName: json["methodName"],
        returnValue: json["returnValue"],
        parameters: List<Parameter>.from(
            json["parameters"].map((x) => Parameter.fromMap(x))),
      );

  Method copyWith({
    String? methodName,
    String? type,
    List<Parameter>? parameters,
  }) =>
      Method(
        id: id,
        methodName: methodName ?? this.methodName,
        returnValue: type ?? returnValue,
        parameters: parameters ?? this.parameters,
      );

  Map<String, dynamic> toMap() => {
        "methodName": methodName,
        "returnValue": returnValue,
        "parameters": List<dynamic>.from(parameters.map((x) => x.toMap())),
      };

  @override
  bool operator ==(covariant Method other) {
    if (identical(this, other)) return true;

    return other.methodName == methodName &&
        other.returnValue == returnValue &&
        other.parameters == parameters;
  }

  @override
  int get hashCode {
    return methodName.hashCode ^ returnValue.hashCode ^ parameters.hashCode;
  }
}
