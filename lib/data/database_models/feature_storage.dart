import 'package:flutter_arhitect/data/database_models/base_architecture_element_storage.dart';
import 'package:flutter_arhitect/data/database_models/database_storage.dart';
import 'package:hive/hive.dart';

part 'feature_storage.g.dart';

@HiveType(typeId: 1)
class FeatureStorage extends HiveObject with DatabaseStorage {
  static const boxName = 'feature_storage';
  @HiveField(0)
  final List<BaseArchitectureElementStorage> elements;
  @override
  @HiveField(1)
  final DateTime addedAt;

  FeatureStorage({
    required this.elements,
    required this.addedAt,
  });
}
