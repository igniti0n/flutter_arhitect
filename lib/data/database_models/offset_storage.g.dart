// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offset_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OffsetStorageAdapter extends TypeAdapter<OffsetStorage> {
  @override
  final int typeId = 7;

  @override
  OffsetStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OffsetStorage(
      xOffset: fields[0] as double,
      yOffset: fields[1] as double,
    );
  }

  @override
  void write(BinaryWriter writer, OffsetStorage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.xOffset)
      ..writeByte(1)
      ..write(obj.yOffset);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OffsetStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
