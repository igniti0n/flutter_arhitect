import 'package:flutter/material.dart';
import 'package:flutter_arhitect/common/models/arhitecture_elements/base_arhitecture_element.dart';
import 'package:flutter_arhitect/data/database_models/architecture_layer_storage.dart';
import 'package:flutter_arhitect/data/database_models/brick_storage.dart';
import 'package:flutter_arhitect/data/database_models/method_storage.dart';
import 'package:flutter_arhitect/data/database_models/offset_storage.dart';
import 'package:hive/hive.dart';

part 'base_architecture_element_storage.g.dart';

@HiveType(typeId: 2)
class BaseArchitectureElementStorage extends HiveObject {
  @HiveField(0)
  final String id;
  // @HiveField(1)
  // final GlobalKey widgetsGlobalKey;
  // @HiveField(2)
  // final Key positionedDraggableKey;
  @HiveField(3)
  final ArchitectureLayerStorage layer;
  @HiveField(4)
  final String name;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final List<BaseArchitectureElementStorage> dependencies;
  @HiveField(7)
  final List<MethodStorage> methods;
  @HiveField(8)
  final String dataValue;
  @HiveField(9)
  final OffsetStorage canvasPosition;
  @HiveField(10)
  final BrickStorage brick;
  @HiveField(11)
  final double ySize;
  @HiveField(12)
  final double xSize;

  BaseArchitectureElementStorage({
    required this.id,
    // required this.widgetsGlobalKey,
    // required this.positionedDraggableKey,
    required this.layer,
    required this.name,
    required this.description,
    required this.dependencies,
    required this.methods,
    required this.dataValue,
    required this.brick,
    required this.canvasPosition,
    required this.ySize,
    required this.xSize,
  });

  factory BaseArchitectureElementStorage.fromBaseArchitectureElement(
    BaseArhitectureElement element,
  ) =>
      BaseArchitectureElementStorage(
        id: element.id,
        // widgetsGlobalKey: element.widgetsGlobalKey,
        // positionedDraggableKey: element.positionedDraggableKey,

        layer: ArchitectureLayerStorage.fromArchitectureLayer(element.layer),
        name: element.name,
        description: element.description,
        dependencies: element.dependencies
            .map((e) =>
                BaseArchitectureElementStorage.fromBaseArchitectureElement(e))
            .toList(),
        methods:
            element.methods.map((e) => MethodStorage.fromMethod(e)).toList(),
        dataValue: element.dataValue,
        brick: BrickStorage.fromBrick(element.brick),
        canvasPosition: OffsetStorage.fromOffset(element.canvasPosition),
        ySize: element.size.width,
        xSize: element.size.height,
      );

  BaseArhitectureElement toBaseArchitectureElement() => BaseArhitectureElement(
        id: id,
        // widgetsGlobalKey: widgetsGlobalKey,
        widgetsGlobalKey: GlobalKey(),
        // positionedDraggableKey: positionedDraggableKey,
        positionedDraggableKey: UniqueKey(),
        layer: layer.toArhitectureLayer(),
        name: name,
        description: description,
        dependencies:
            dependencies.map((e) => e.toBaseArchitectureElement()).toList(),
        methods: methods.map((e) => e.toMethod()).toList(),
        dataValue: dataValue,
        brick: brick.toBrick(),
        canvasPosition: canvasPosition.toOffset(),
        size: Size(xSize, ySize),
      );
}
