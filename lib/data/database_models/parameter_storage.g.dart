// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParameterStorageAdapter extends TypeAdapter<ParameterStorage> {
  @override
  final int typeId = 4;

  @override
  ParameterStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParameterStorage(
      id: fields[0] as String,
      parameterName: fields[1] as String,
      type: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ParameterStorage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.parameterName)
      ..writeByte(2)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParameterStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
