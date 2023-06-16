// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brick_storage.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BrickStorageAdapter extends TypeAdapter<BrickStorage> {
  @override
  final int typeId = 5;

  @override
  BrickStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BrickStorage(
      name: fields[0] as String?,
      path: fields[1] as String?,
      git: fields[2] as GitPathStorage?,
      version: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BrickStorage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.git)
      ..writeByte(3)
      ..write(obj.version);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrickStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GitPathStorageAdapter extends TypeAdapter<GitPathStorage> {
  @override
  final int typeId = 8;

  @override
  GitPathStorage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GitPathStorage(
      fields[0] as String,
      path: fields[1] as String?,
      ref: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GitPathStorage obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.ref);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GitPathStorageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
