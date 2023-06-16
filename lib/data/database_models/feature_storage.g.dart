// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeatureStorageAdapter extends TypeAdapter<FeatureStorage> {
  @override
  final int typeId = 1;

  @override
  FeatureStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeatureStorage(
      elements: (fields[0] as List).cast<BaseArchitectureElementStorage>(),
      addedAt: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FeatureStorage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.elements)
      ..writeByte(1)
      ..write(obj.addedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeatureStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
