// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttachmentHiveModelAdapter extends TypeAdapter<AttachmentHiveModel> {
  @override
  final int typeId = 1;

  @override
  AttachmentHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttachmentHiveModel(
      id: fields[0] as String,
      storagePath: fields[1] as String,
      kind: fields[2] as String,
      ocrVersion: fields[3] as String?,
      fieldsExtracted: (fields[4] as Map?)?.cast<String, dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, AttachmentHiveModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.storagePath)
      ..writeByte(2)
      ..write(obj.kind)
      ..writeByte(3)
      ..write(obj.ocrVersion)
      ..writeByte(4)
      ..write(obj.fieldsExtracted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttachmentHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DepositHiveModelAdapter extends TypeAdapter<DepositHiveModel> {
  @override
  final int typeId = 2;

  @override
  DepositHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DepositHiveModel(
      id: fields[0] as String,
      srNo: fields[1] as String,
      holders: (fields[2] as List).cast<String>(),
      bankName: fields[3] as String,
      accountNumber: fields[4] as String,
      fdrNo: fields[5] as String,
      amountDeposited: fields[6] as double,
      dueAmount: fields[7] as double,
      dateDeposited: fields[8] as DateTime,
      dueDate: fields[9] as DateTime,
      status: fields[10] as String,
      closureType: fields[11] as String?,
      previousDepositId: fields[12] as String?,
      nextDepositId: fields[13] as String?,
      chainId: fields[14] as String?,
      createdAt: fields[15] as DateTime,
      updatedAt: fields[16] as DateTime,
      notes: fields[17] as String?,
      attachments: (fields[18] as List).cast<AttachmentHiveModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, DepositHiveModel obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.srNo)
      ..writeByte(2)
      ..write(obj.holders)
      ..writeByte(3)
      ..write(obj.bankName)
      ..writeByte(4)
      ..write(obj.accountNumber)
      ..writeByte(5)
      ..write(obj.fdrNo)
      ..writeByte(6)
      ..write(obj.amountDeposited)
      ..writeByte(7)
      ..write(obj.dueAmount)
      ..writeByte(8)
      ..write(obj.dateDeposited)
      ..writeByte(9)
      ..write(obj.dueDate)
      ..writeByte(10)
      ..write(obj.status)
      ..writeByte(11)
      ..write(obj.closureType)
      ..writeByte(12)
      ..write(obj.previousDepositId)
      ..writeByte(13)
      ..write(obj.nextDepositId)
      ..writeByte(14)
      ..write(obj.chainId)
      ..writeByte(15)
      ..write(obj.createdAt)
      ..writeByte(16)
      ..write(obj.updatedAt)
      ..writeByte(17)
      ..write(obj.notes)
      ..writeByte(18)
      ..write(obj.attachments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DepositHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
