// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'architecture_layer_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArchitectureLayerStorageAdapter
    extends TypeAdapter<ArchitectureLayerStorage> {
  @override
  final int typeId = 6;

  @override
  ArchitectureLayerStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArchitectureLayerStorage(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ArchitectureLayerStorage obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArchitectureLayerStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
