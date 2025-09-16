import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/deposit.dart';
import '../../domain/entities/deposit_chain.dart';
import '../../domain/repositories/lineage_repository.dart';
import '../models/deposit_hive_model.dart';
import '../models/deposit_chain_hive_model.dart';
import '../../../../core/utils/hive_bootstrap.dart';

class HiveLineageRepository implements LineageRepository {
  final Uuid _uuid = const Uuid();

  Box<DepositChainHiveModel> get _chainsBox {
    if (!Hive.isBoxOpen(HiveBootstrap.chainsBoxName)) {
      throw Exception('Chains box not opened. Please restart the app.');
    }
    return Hive.box<DepositChainHiveModel>(HiveBootstrap.chainsBoxName);
  }

  Box<ChainLinkHiveModel> get _linksBox {
    if (!Hive.isBoxOpen(HiveBootstrap.linksBoxName)) {
      throw Exception('Links box not opened. Please restart the app.');
    }
    return Hive.box<ChainLinkHiveModel>(HiveBootstrap.linksBoxName);
  }

  Box<DepositHiveModel> get _depositsBox {
    if (!Hive.isBoxOpen(HiveBootstrap.depositsBoxName)) {
      throw Exception('Deposits box not opened. Please restart the app.');
    }
    return Hive.box<DepositHiveModel>(HiveBootstrap.depositsBoxName);
  }

  @override
  Future<DepositChain> createChain({
    required String name,
    String? description,
  }) async {
    print('🏗️ createChain called - Name: $name');
    final chainId = _uuid.v4();
    final now = DateTime.now();
    print('Generated chain ID: $chainId');

    final chain = DepositChainHiveModel(
      id: chainId,
      name: name,
      createdAt: now,
      updatedAt: now,
      description: description,
      depositIds: [],
      totalDeposits: 0,
      totalAmount: 0.0,
      currentValue: 0.0,
      status: ChainStatus.active.index,
    );

    print('Saving chain to Hive box...');
    await _chainsBox.put(chainId, chain);
    print('✅ Chain saved to Hive box');

    final domainChain = _toDomainChain(chain);
    print('✅ Domain chain created: ${domainChain.name} (${domainChain.id})');
    return domainChain;
  }

  @override
  Future<List<DepositChain>> getAllChains() async {
    return _chainsBox.values.map(_toDomainChain).toList();
  }

  @override
  Future<DepositChain?> getChain(String chainId) async {
    final chain = _chainsBox.get(chainId);
    return chain != null ? _toDomainChain(chain) : null;
  }

  @override
  Future<DepositChain> updateChain(DepositChain chain) async {
    final hiveChain = _toHiveChain(chain);
    await _chainsBox.put(chain.id, hiveChain);
    return chain;
  }

  @override
  Future<void> deleteChain(String chainId) async {
    await _chainsBox.delete(chainId);
    // Also delete all links for this chain
    final links = _linksBox.values
        .where((link) =>
            _chainsBox
                    .get(chainId)
                    ?.depositIds
                    .contains(link.parentDepositId) ==
                true ||
            _chainsBox.get(chainId)?.depositIds.contains(link.childDepositId) ==
                true)
        .toList();

    for (final link in links) {
      await _linksBox.delete('${link.parentDepositId}_${link.childDepositId}');
    }
  }

  @override
  Future<ChainLink> linkDeposits({
    required String parentDepositId,
    required String childDepositId,
    required double reinvestedAmount,
    String? notes,
  }) async {
    final linkId = '${parentDepositId}_$childDepositId';
    final now = DateTime.now();

    final link = ChainLinkHiveModel(
      parentDepositId: parentDepositId,
      childDepositId: childDepositId,
      linkedAt: now,
      reinvestedAmount: reinvestedAmount,
      notes: notes,
    );

    await _linksBox.put(linkId, link);

    // Update the chain statistics
    await _updateChainStatistics(parentDepositId);
    await _updateChainStatistics(childDepositId);

    return _toDomainLink(link);
  }

  @override
  Future<void> unlinkDeposits(
      String parentDepositId, String childDepositId) async {
    final linkId = '${parentDepositId}_$childDepositId';
    await _linksBox.delete(linkId);

    // Update chain statistics
    await _updateChainStatistics(parentDepositId);
    await _updateChainStatistics(childDepositId);
  }

  @override
  Future<List<ChainLink>> getDepositLinks(String depositId) async {
    return _linksBox.values
        .where((link) =>
            link.parentDepositId == depositId ||
            link.childDepositId == depositId)
        .map(_toDomainLink)
        .toList();
  }

  @override
  Future<DepositChain?> getDepositChain(String depositId) async {
    for (final chain in _chainsBox.values) {
      if (chain.depositIds.contains(depositId)) {
        return _toDomainChain(chain);
      }
    }
    return null;
  }

  @override
  Future<List<Deposit>> getDepositLineage(String depositId) async {
    final visited = <String>{};
    final lineage = <Deposit>[];

    await _collectLineage(depositId, visited, lineage);

    return lineage;
  }

  Future<void> _collectLineage(
      String depositId, Set<String> visited, List<Deposit> lineage) async {
    if (visited.contains(depositId)) return;
    visited.add(depositId);

    final deposit = _depositsBox.get(depositId);
    if (deposit != null) {
      lineage.add(_toDomainDeposit(deposit));
    }

    // Find parent and child deposits
    final links = _linksBox.values.where((link) =>
        link.parentDepositId == depositId || link.childDepositId == depositId);

    for (final link in links) {
      final relatedDepositId = link.parentDepositId == depositId
          ? link.childDepositId
          : link.parentDepositId;
      await _collectLineage(relatedDepositId, visited, lineage);
    }
  }

  @override
  Future<Map<String, dynamic>> getChainStatistics(String chainId) async {
    final chain = _chainsBox.get(chainId);
    if (chain == null) return {};

    final deposits = chain.depositIds
        .map((id) => _depositsBox.get(id))
        .where((deposit) => deposit != null)
        .cast<DepositHiveModel>()
        .toList();

    final totalAmount =
        deposits.fold(0.0, (sum, deposit) => sum + deposit.amountDeposited);
    final currentValue =
        deposits.fold(0.0, (sum, deposit) => sum + deposit.dueAmount);
    // DepositHiveModel.status is stored as a String (e.g., 'active', 'matured')
    final activeDeposits =
        deposits.where((d) => d.status == DepositStatus.active.name).length;
    final maturedDeposits =
        deposits.where((d) => d.status == DepositStatus.matured.name).length;

    return {
      'totalDeposits': deposits.length,
      'totalAmount': totalAmount,
      'currentValue': currentValue,
      'activeDeposits': activeDeposits,
      'maturedDeposits': maturedDeposits,
      'averageAmount':
          deposits.isNotEmpty ? totalAmount / deposits.length : 0.0,
    };
  }

  @override
  Future<List<DepositChain>> getChainsWithDeposits() async {
    print('🔍 getChainsWithDeposits called');
    final allChains = _chainsBox.values.toList();
    print('Total chains in box: ${allChains.length}');

    for (var chain in allChains) {
      print('Chain: ${chain.name} - Deposit IDs: ${chain.depositIds}');
    }

    final chainsWithDeposits = allChains.map(_toDomainChain).toList();

    print('Chains with deposits: ${chainsWithDeposits.length}');
    return chainsWithDeposits;
  }

  @override
  Future<DepositChain> addDepositToChain(
      String chainId, String depositId) async {
    print('🔗 addDepositToChain called - Chain: $chainId, Deposit: $depositId');
    final chain = _chainsBox.get(chainId);
    if (chain == null) {
      print('❌ Chain not found: $chainId');
      throw Exception('Chain not found');
    }

    print('Current chain deposit IDs: ${chain.depositIds}');
    final updatedDepositIds = List<String>.from(chain.depositIds);
    if (!updatedDepositIds.contains(depositId)) {
      updatedDepositIds.add(depositId);
      print('✅ Added deposit $depositId to chain');
    } else {
      print('⚠️ Deposit $depositId already in chain');
    }

    final updatedChain = DepositChainHiveModel(
      id: chain.id,
      name: chain.name,
      createdAt: chain.createdAt,
      updatedAt: DateTime.now(),
      description: chain.description,
      depositIds: updatedDepositIds,
      totalDeposits: updatedDepositIds.length,
      totalAmount: chain.totalAmount,
      currentValue: chain.currentValue,
      status: chain.status,
    );

    await _chainsBox.put(chainId, updatedChain);
    await _updateChainStatistics(chainId);
    print('✅ Chain updated in Hive box');

    return _toDomainChain(updatedChain);
  }

  @override
  Future<DepositChain> removeDepositFromChain(
      String chainId, String depositId) async {
    final chain = _chainsBox.get(chainId);
    if (chain == null) throw Exception('Chain not found');

    final updatedDepositIds = List<String>.from(chain.depositIds);
    updatedDepositIds.remove(depositId);

    final updatedChain = DepositChainHiveModel(
      id: chain.id,
      name: chain.name,
      createdAt: chain.createdAt,
      updatedAt: DateTime.now(),
      description: chain.description,
      depositIds: updatedDepositIds,
      totalDeposits: updatedDepositIds.length,
      totalAmount: chain.totalAmount,
      currentValue: chain.currentValue,
      status: chain.status,
    );

    await _chainsBox.put(chainId, updatedChain);
    await _updateChainStatistics(chainId);

    return _toDomainChain(updatedChain);
  }

  @override
  Future<List<Deposit>> getOrphanedDeposits() async {
    final allDepositIds = _depositsBox.keys.cast<String>().toSet();
    final chainedDepositIds = <String>{};

    for (final chain in _chainsBox.values) {
      chainedDepositIds.addAll(chain.depositIds);
    }

    final orphanedIds = allDepositIds.difference(chainedDepositIds);

    return orphanedIds
        .map((id) => _depositsBox.get(id))
        .where((deposit) => deposit != null)
        .map((deposit) => _toDomainDeposit(deposit!))
        .toList();
  }

  @override
  Future<DepositChain> mergeChains(
      String sourceChainId, String targetChainId) async {
    final sourceChain = _chainsBox.get(sourceChainId);
    final targetChain = _chainsBox.get(targetChainId);

    if (sourceChain == null || targetChain == null) {
      throw Exception('One or both chains not found');
    }

    final mergedDepositIds = List<String>.from(targetChain.depositIds);
    mergedDepositIds.addAll(sourceChain.depositIds);

    final mergedChain = DepositChainHiveModel(
      id: targetChainId,
      name: targetChain.name,
      createdAt: targetChain.createdAt,
      updatedAt: DateTime.now(),
      description: targetChain.description,
      depositIds: mergedDepositIds,
      totalDeposits: mergedDepositIds.length,
      totalAmount: targetChain.totalAmount + sourceChain.totalAmount,
      currentValue: targetChain.currentValue + sourceChain.currentValue,
      status: targetChain.status,
    );

    await _chainsBox.put(targetChainId, mergedChain);
    await _chainsBox.delete(sourceChainId);
    await _updateChainStatistics(targetChainId);

    return _toDomainChain(mergedChain);
  }

  @override
  Future<List<DepositChain>> splitChain(
      String chainId, String splitAtDepositId) async {
    final chain = _chainsBox.get(chainId);
    if (chain == null) throw Exception('Chain not found');

    final splitIndex = chain.depositIds.indexOf(splitAtDepositId);
    if (splitIndex == -1) throw Exception('Deposit not found in chain');

    final firstPartIds = chain.depositIds.sublist(0, splitIndex + 1);
    final secondPartIds = chain.depositIds.sublist(splitIndex + 1);

    // Create first chain (original)
    final firstChain = DepositChainHiveModel(
      id: chainId,
      name: chain.name,
      createdAt: chain.createdAt,
      updatedAt: DateTime.now(),
      description: chain.description,
      depositIds: firstPartIds,
      totalDeposits: firstPartIds.length,
      totalAmount: chain.totalAmount,
      currentValue: chain.currentValue,
      status: chain.status,
    );

    // Create second chain (new)
    final secondChainId = _uuid.v4();
    final secondChain = DepositChainHiveModel(
      id: secondChainId,
      name: '${chain.name} (Split)',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      description: 'Split from ${chain.name}',
      depositIds: secondPartIds,
      totalDeposits: secondPartIds.length,
      totalAmount: 0.0,
      currentValue: 0.0,
      status: ChainStatus.active.index,
    );

    await _chainsBox.put(chainId, firstChain);
    await _chainsBox.put(secondChainId, secondChain);

    await _updateChainStatistics(chainId);
    await _updateChainStatistics(secondChainId);

    return [_toDomainChain(firstChain), _toDomainChain(secondChain)];
  }

  Future<void> _updateChainStatistics(String depositId) async {
    final chain = await getDepositChain(depositId);
    if (chain == null) return;

    final deposits = chain.depositIds
        .map((id) => _depositsBox.get(id))
        .where((deposit) => deposit != null)
        .cast<DepositHiveModel>()
        .toList();

    final totalAmount =
        deposits.fold(0.0, (sum, deposit) => sum + deposit.amountDeposited);
    final currentValue =
        deposits.fold(0.0, (sum, deposit) => sum + deposit.dueAmount);

    final updatedChain = DepositChainHiveModel(
      id: chain.id,
      name: chain.name,
      createdAt: chain.createdAt,
      updatedAt: DateTime.now(),
      description: chain.description,
      depositIds: chain.depositIds,
      totalDeposits: deposits.length,
      totalAmount: totalAmount,
      currentValue: currentValue,
      status: chain.status.index,
    );

    await _chainsBox.put(chain.id, updatedChain);
  }

  // Conversion methods
  DepositChain _toDomainChain(DepositChainHiveModel hive) {
    print('🔄 Converting Hive chain to domain: ${hive.name} (${hive.id})');
    print('Hive status: ${hive.status}, Deposit IDs: ${hive.depositIds}');
    return DepositChain(
      id: hive.id,
      name: hive.name,
      createdAt: hive.createdAt,
      updatedAt: hive.updatedAt,
      description: hive.description,
      depositIds: List.from(hive.depositIds),
      totalDeposits: hive.totalDeposits,
      totalAmount: hive.totalAmount,
      currentValue: hive.currentValue,
      status: ChainStatus.values[hive.status],
    );
  }

  DepositChainHiveModel _toHiveChain(DepositChain domain) {
    return DepositChainHiveModel(
      id: domain.id,
      name: domain.name,
      createdAt: domain.createdAt,
      updatedAt: domain.updatedAt,
      description: domain.description,
      depositIds: List.from(domain.depositIds),
      totalDeposits: domain.totalDeposits,
      totalAmount: domain.totalAmount,
      currentValue: domain.currentValue,
      status: domain.status.index,
    );
  }

  ChainLink _toDomainLink(ChainLinkHiveModel hive) {
    return ChainLink(
      parentDepositId: hive.parentDepositId,
      childDepositId: hive.childDepositId,
      linkedAt: hive.linkedAt,
      reinvestedAmount: hive.reinvestedAmount,
      notes: hive.notes,
    );
  }

  Deposit _toDomainDeposit(DepositHiveModel hive) {
    return Deposit(
      id: hive.id,
      srNo: hive.srNo,
      holders: hive.holders,
      bankName: hive.bankName,
      accountNumber: hive.accountNumber,
      fdrNo: hive.fdrNo,
      amountDeposited: hive.amountDeposited,
      dueAmount: hive.dueAmount,
      dateDeposited: hive.dateDeposited,
      dueDate: hive.dueDate,
      status: DepositStatus.values.firstWhere(
        (e) => e.name == hive.status,
        orElse: () => DepositStatus.active,
      ),
      closureType: hive.closureType != null
          ? ClosureType.values.firstWhere(
              (e) => e.name == hive.closureType!,
              orElse: () => ClosureType.unknown,
            )
          : null,
      previousDepositId: hive.previousDepositId,
      nextDepositId: hive.nextDepositId,
      chainId: hive.chainId,
      createdAt: hive.createdAt,
      updatedAt: hive.updatedAt,
      notes: hive.notes,
      attachments: hive.attachments
          .map((a) => Attachment(
                id: a.id,
                storagePath: a.storagePath,
                kind: AttachmentKind.values.firstWhere(
                  (e) => e.name == a.kind,
                  orElse: () => AttachmentKind.other,
                ),
                ocrVersion: a.ocrVersion,
                fieldsExtracted: a.fieldsExtracted,
              ))
          .toList(),
    );
  }
}
