import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/method.dart';
import 'package:flutter_arhitect/data/database_models/parameter_storage.dart';
import 'package:hive/hive.dart';

part 'method_storage.g.dart';

@HiveType(typeId: 3)
class MethodStorage extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String methodName;
  @HiveField(2)
  final String returnValue;
  @HiveField(3)
  final List<ParameterStorage> parameters;

  MethodStorage({
    required this.id,
    required this.methodName,
    required this.returnValue,
    required this.parameters,
  });

  Method toMethod() => Method(
        id: id,
        methodName: methodName,
        returnValue: returnValue,
        parameters: parameters.map((e) => e.toParameter()).toList(),
      );

  factory MethodStorage.fromMethod(Method method) => MethodStorage(
        id: method.id,
        methodName: method.methodName,
        returnValue: method.returnValue,
        parameters: method.parameters
            .map((e) => ParameterStorage(
                  id: e.id,
                  parameterName: e.parameterName,
                  type: e.type,
                ))
            .toList(),
      );
}
