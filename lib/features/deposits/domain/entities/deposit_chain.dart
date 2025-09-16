import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_chain.freezed.dart';
part 'deposit_chain.g.dart';

@freezed
class DepositChain with _$DepositChain {
  const DepositChain._();

  const factory DepositChain({
    required String id,
    required String name,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? description,
    @Default([]) List<String> depositIds,
    @Default(0) int totalDeposits,
    @Default(0.0) double totalAmount,
    @Default(0.0) double currentValue,
    @Default(ChainStatus.active) ChainStatus status,
  }) = _DepositChain;

  factory DepositChain.fromJson(Map<String, dynamic> json) =>
      _$DepositChainFromJson(json);

  /// Get the root deposit (first in the chain)
  String? get rootDepositId => depositIds.isNotEmpty ? depositIds.first : null;

  /// Get the latest deposit (last in the chain)
  String? get latestDepositId => depositIds.isNotEmpty ? depositIds.last : null;

  /// Check if this chain has any deposits
  bool get isEmpty => depositIds.isEmpty;

  /// Check if this chain has deposits
  bool get isNotEmpty => depositIds.isNotEmpty;

  /// Get the length of the chain
  int get length => depositIds.length;
}

enum ChainStatus {
  active,
  closed,
  archived,
}

@freezed
class ChainLink with _$ChainLink {
  const ChainLink._();

  const factory ChainLink({
    required String parentDepositId,
    required String childDepositId,
    required DateTime linkedAt,
    required double reinvestedAmount,
    String? notes,
  }) = _ChainLink;

  factory ChainLink.fromJson(Map<String, dynamic> json) =>
      _$ChainLinkFromJson(json);

  /// Check if this link is valid
  bool get isValid => parentDepositId.isNotEmpty && childDepositId.isNotEmpty;
}
