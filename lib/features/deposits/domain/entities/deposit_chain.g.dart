// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepositChainImpl _$$DepositChainImplFromJson(Map<String, dynamic> json) =>
    _$DepositChainImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      description: json['description'] as String?,
      depositIds: (json['depositIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      totalDeposits: (json['totalDeposits'] as num?)?.toInt() ?? 0,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      currentValue: (json['currentValue'] as num?)?.toDouble() ?? 0.0,
      status: $enumDecodeNullable(_$ChainStatusEnumMap, json['status']) ??
          ChainStatus.active,
    );

Map<String, dynamic> _$$DepositChainImplToJson(_$DepositChainImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'description': instance.description,
      'depositIds': instance.depositIds,
      'totalDeposits': instance.totalDeposits,
      'totalAmount': instance.totalAmount,
      'currentValue': instance.currentValue,
      'status': _$ChainStatusEnumMap[instance.status]!,
    };

const _$ChainStatusEnumMap = {
  ChainStatus.active: 'active',
  ChainStatus.closed: 'closed',
  ChainStatus.archived: 'archived',
};

_$ChainLinkImpl _$$ChainLinkImplFromJson(Map<String, dynamic> json) =>
    _$ChainLinkImpl(
      parentDepositId: json['parentDepositId'] as String,
      childDepositId: json['childDepositId'] as String,
      linkedAt: DateTime.parse(json['linkedAt'] as String),
      reinvestedAmount: (json['reinvestedAmount'] as num).toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$ChainLinkImplToJson(_$ChainLinkImpl instance) =>
    <String, dynamic>{
      'parentDepositId': instance.parentDepositId,
      'childDepositId': instance.childDepositId,
      'linkedAt': instance.linkedAt.toIso8601String(),
      'reinvestedAmount': instance.reinvestedAmount,
      'notes': instance.notes,
    };
