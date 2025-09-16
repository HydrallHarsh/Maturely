// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentImpl _$$AttachmentImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentImpl(
      id: json['id'] as String,
      storagePath: json['storagePath'] as String,
      kind: $enumDecode(_$AttachmentKindEnumMap, json['kind']),
      ocrVersion: json['ocrVersion'] as String?,
      fieldsExtracted: json['fieldsExtracted'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AttachmentImplToJson(_$AttachmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'storagePath': instance.storagePath,
      'kind': _$AttachmentKindEnumMap[instance.kind]!,
      'ocrVersion': instance.ocrVersion,
      'fieldsExtracted': instance.fieldsExtracted,
    };

const _$AttachmentKindEnumMap = {
  AttachmentKind.receipt: 'receipt',
  AttachmentKind.diaryPage: 'diary_page',
  AttachmentKind.other: 'other',
};

_$DepositImpl _$$DepositImplFromJson(Map<String, dynamic> json) =>
    _$DepositImpl(
      id: json['id'] as String,
      srNo: json['srNo'] as String,
      holders:
          (json['holders'] as List<dynamic>).map((e) => e as String).toList(),
      bankName: json['bankName'] as String,
      accountNumber: json['accountNumber'] as String,
      fdrNo: json['fdrNo'] as String,
      amountDeposited: (json['amountDeposited'] as num).toDouble(),
      dueAmount: (json['dueAmount'] as num).toDouble(),
      dateDeposited: DateTime.parse(json['dateDeposited'] as String),
      dueDate: DateTime.parse(json['dueDate'] as String),
      status: $enumDecodeNullable(_$DepositStatusEnumMap, json['status']) ??
          DepositStatus.active,
      closureType:
          $enumDecodeNullable(_$ClosureTypeEnumMap, json['closureType']),
      previousDepositId: json['previousDepositId'] as String?,
      nextDepositId: json['nextDepositId'] as String?,
      chainId: json['chainId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      notes: json['notes'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$DepositImplToJson(_$DepositImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'srNo': instance.srNo,
      'holders': instance.holders,
      'bankName': instance.bankName,
      'accountNumber': instance.accountNumber,
      'fdrNo': instance.fdrNo,
      'amountDeposited': instance.amountDeposited,
      'dueAmount': instance.dueAmount,
      'dateDeposited': instance.dateDeposited.toIso8601String(),
      'dueDate': instance.dueDate.toIso8601String(),
      'status': _$DepositStatusEnumMap[instance.status]!,
      'closureType': _$ClosureTypeEnumMap[instance.closureType],
      'previousDepositId': instance.previousDepositId,
      'nextDepositId': instance.nextDepositId,
      'chainId': instance.chainId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'notes': instance.notes,
      'attachments': instance.attachments,
    };

const _$DepositStatusEnumMap = {
  DepositStatus.active: 'active',
  DepositStatus.matured: 'matured',
  DepositStatus.closed: 'closed',
  DepositStatus.inProcess: 'inProcess',
};

const _$ClosureTypeEnumMap = {
  ClosureType.reinvested: 'reinvested',
  ClosureType.withdrawn: 'withdrawn',
  ClosureType.unknown: 'unknown',
};
