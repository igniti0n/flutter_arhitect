import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/parameter.dart';
import 'package:hive/hive.dart';

part 'parameter_storage.g.dart';

@HiveType(typeId: 4)
class ParameterStorage extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String parameterName;
  @HiveField(2)
  final String type;

  ParameterStorage({
    required this.id,
    required this.parameterName,
    required this.type,
  });

  Parameter toParameter() => Parameter(
        id: id,
        parameterName: parameterName,
        type: type,
      );
}
