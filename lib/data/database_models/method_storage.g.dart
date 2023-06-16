// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'method_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MethodStorageAdapter extends TypeAdapter<MethodStorage> {
  @override
  final int typeId = 3;

  @override
  MethodStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MethodStorage(
      id: fields[0] as String,
      methodName: fields[1] as String,
      returnValue: fields[2] as String,
      parameters: (fields[3] as List).cast<ParameterStorage>(),
    );
  }

  @override
  void write(BinaryWriter writer, MethodStorage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.methodName)
      ..writeByte(2)
      ..write(obj.returnValue)
      ..writeByte(3)
      ..write(obj.parameters);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MethodStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
