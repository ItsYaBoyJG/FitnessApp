// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: library_private_types_in_public_api

part of 'local_storage.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class CreateAccountAdapter extends TypeAdapter<_CreateAccount> {
  @override
  final typeId = 0;

  @override
  _CreateAccount read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _CreateAccount(
      accountCreated: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, _CreateAccount obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.accountCreated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateAccountAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
