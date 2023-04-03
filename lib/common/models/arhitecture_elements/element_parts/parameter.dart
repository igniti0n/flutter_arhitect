import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Parameter extends Equatable {
  final String id;
  final String parameterName;
  final String type;

  const Parameter({
    required this.id,
    required this.parameterName,
    required this.type,
  });

  factory Parameter.defaultParameter() => Parameter(
        id: const Uuid().v1(),
        parameterName: 'parameterName',
        type: 'int',
      );

  factory Parameter.fromMap(Map<String, dynamic> json) => Parameter(
        id: json['id'],
        parameterName: json['parameterName'],
        type: json['type'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'parameterName': parameterName,
        'type': type,
      };

  Parameter copyWith({String? parameterName, String? type}) => Parameter(
        id: id,
        parameterName: parameterName ?? this.parameterName,
        type: type ?? this.type,
      );

  @override
  List<Object?> get props => [id, parameterName, type];
}
