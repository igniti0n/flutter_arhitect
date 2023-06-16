import 'package:flutter_arhitect/common/models/arhitecture_elements/element_parts/arhitecture_layer.dart';
import 'package:hive/hive.dart';

part 'architecture_layer_storage.g.dart';

@HiveType(typeId: 6)
class ArchitectureLayerStorage extends HiveObject {
  @HiveField(0)
  final String name;

  ArchitectureLayerStorage({
    required this.name,
  });

  factory ArchitectureLayerStorage.fromArchitectureLayer(
    ArhitectureLayer layer,
  ) =>
      ArchitectureLayerStorage(
        name: layer.name,
      );

  ArhitectureLayer toArhitectureLayer() => ArhitectureLayer.values.firstWhere(
        (element) => element.name == name,
        orElse: () => ArhitectureLayer.data,
      );
}
