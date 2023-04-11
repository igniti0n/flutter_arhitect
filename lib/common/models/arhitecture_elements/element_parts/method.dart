import 'package:equatable/equatable.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/parameter.dart';
import 'package:uuid/uuid.dart';

class Method extends Equatable {
  final String id;
  final String methodName;
  final String returnValue;
  final List<Parameter> parameters;

  const Method({
    required this.id,
    required this.methodName,
    required this.returnValue,
    required this.parameters,
  });

  factory Method.defaultMethod() => Method(
        id: const Uuid().v1(),
        methodName: 'methodName',
        returnValue: 'void',
        parameters: const [],
      );

  factory Method.fromMap(Map<String, dynamic> json) => Method(
        id: json['id'],
        methodName: json['methodName'],
        returnValue: json['type'],
        parameters: List<Parameter>.from(
          json['parameters'].map((x) => Parameter.fromMap(x)),
        ),
      );

  Map<String, dynamic> toMap() => {
        'methodName': methodName,
        'type': returnValue,
        'parameters': List.from(parameters.map((x) => x.toMap())),
      };

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

  @override
  List<Object?> get props => [
        id,
        methodName,
        returnValue,
        parameters,
      ];
}
