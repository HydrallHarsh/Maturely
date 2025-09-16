// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_chain_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DepositChainHiveModelAdapter extends TypeAdapter<DepositChainHiveModel> {
  @override
  final int typeId = 4;

  @override
  DepositChainHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DepositChainHiveModel(
      id: fields[0] as String,
      name: fields[1] as String,
      createdAt: fields[2] as DateTime,
      updatedAt: fields[3] as DateTime,
      description: fields[4] as String?,
      depositIds: (fields[5] as List).cast<String>(),
      totalDeposits: fields[6] as int,
      totalAmount: fields[7] as double,
      currentValue: fields[8] as double,
      status: fields[9] as int,
    );
  }

  @override
  void write(BinaryWriter writer, DepositChainHiveModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.updatedAt)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.depositIds)
      ..writeByte(6)
      ..write(obj.totalDeposits)
      ..writeByte(7)
      ..write(obj.totalAmount)
      ..writeByte(8)
      ..write(obj.currentValue)
      ..writeByte(9)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepositChainHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChainLinkHiveModelAdapter extends TypeAdapter<ChainLinkHiveModel> {
  @override
  final int typeId = 5;

  @override
  ChainLinkHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChainLinkHiveModel(
      parentDepositId: fields[0] as String,
      childDepositId: fields[1] as String,
      linkedAt: fields[2] as DateTime,
      reinvestedAmount: fields[3] as double,
      notes: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ChainLinkHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.parentDepositId)
      ..writeByte(1)
      ..write(obj.childDepositId)
      ..writeByte(2)
      ..write(obj.linkedAt)
      ..writeByte(3)
      ..write(obj.reinvestedAmount)
      ..writeByte(4)
      ..write(obj.notes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChainLinkHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
