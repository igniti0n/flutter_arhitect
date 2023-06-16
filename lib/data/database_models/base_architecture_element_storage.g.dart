// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_architecture_element_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaseArchitectureElementStorageAdapter
    extends TypeAdapter<BaseArchitectureElementStorage> {
  @override
  final int typeId = 2;

  @override
  BaseArchitectureElementStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaseArchitectureElementStorage(
      id: fields[0] as String,
      layer: fields[3] as ArchitectureLayerStorage,
      name: fields[4] as String,
      description: fields[5] as String,
      dependencies: (fields[6] as List).cast<BaseArchitectureElementStorage>(),
      methods: (fields[7] as List).cast<MethodStorage>(),
      dataValue: fields[8] as String,
      brick: fields[10] as BrickStorage,
      canvasPosition: fields[9] as OffsetStorage,
      ySize: (fields[11] ?? 1.0) as double,
      xSize: (fields[12] ?? 1.0) as double,
    );
  }

  @override
  void write(BinaryWriter writer, BaseArchitectureElementStorage obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.layer)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.dependencies)
      ..writeByte(7)
      ..write(obj.methods)
      ..writeByte(8)
      ..write(obj.dataValue)
      ..writeByte(9)
      ..write(obj.canvasPosition)
      ..writeByte(10)
      ..write(obj.brick)
      ..writeByte(11)
      ..write(obj.ySize)
      ..writeByte(12)
      ..write(obj.xSize);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseArchitectureElementStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
