import 'package:uuid/uuid.dart';

class Parameter {
  Parameter({
    required this.id,
    required this.parameterName,
    required this.type,
  });
  String id = const Uuid().v1();
  String parameterName;
  String type;

  factory Parameter.defaultParameter() => Parameter(
        id: const Uuid().v1(),
        parameterName: 'parameterName',
        type: 'int',
      );

  factory Parameter.fromMap(Map<String, dynamic> json) => Parameter(
        id: json["id"],
        parameterName: json["parameterName"],
        type: json["type"],
      );

  Parameter copyWith({String? parameterName, String? type}) => Parameter(
        id: id,
        parameterName: parameterName ?? this.parameterName,
        type: type ?? this.type,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "parameterName": parameterName,
        "type": type,
      };

  @override
  bool operator ==(covariant Parameter other) {
    if (identical(this, other)) return true;

    return other.parameterName == parameterName && other.type == type;
  }

  @override
  int get hashCode {
    return parameterName.hashCode ^ type.hashCode;
  }

  @override
  String toString() {
    return '$type $parameterName';
  }
}
