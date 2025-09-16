import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../../deposits/domain/entities/deposit.dart';
import '../../../deposits/domain/repositories/deposit_repository.dart';
import '../models/deposit_hive_model.dart';
import '../../../../core/utils/hive_bootstrap.dart';

class HiveDepositRepository implements DepositRepository {
  Box<DepositHiveModel> get _box =>
      Hive.box<DepositHiveModel>(HiveBootstrap.depositsBoxName);
  final Uuid _uuid = const Uuid();

  DepositHiveModel _toHive(Deposit d) => DepositHiveModel(
        id: d.id,
        srNo: d.srNo,
        holders: d.holders,
        bankName: d.bankName,
        accountNumber: d.accountNumber,
        fdrNo: d.fdrNo,
        amountDeposited: d.amountDeposited,
        dueAmount: d.dueAmount,
        dateDeposited: d.dateDeposited,
        dueDate: d.dueDate,
        status: d.status.name,
        closureType: d.closureType?.name,
        previousDepositId: d.previousDepositId,
        nextDepositId: d.nextDepositId,
        chainId: d.chainId,
        createdAt: d.createdAt,
        updatedAt: d.updatedAt,
        notes: d.notes,
        attachments: d.attachments
            .map((a) => AttachmentHiveModel(
                  id: a.id,
                  storagePath: a.storagePath,
                  kind: a.kind.name,
                  ocrVersion: a.ocrVersion,
                  fieldsExtracted: a.fieldsExtracted,
                ))
            .toList(),
      );

  Deposit _fromHive(DepositHiveModel h) => Deposit(
        id: h.id,
        srNo: h.srNo,
        holders: h.holders,
        bankName: h.bankName,
        accountNumber: h.accountNumber,
        fdrNo: h.fdrNo,
        amountDeposited: h.amountDeposited,
        dueAmount: h.dueAmount,
        dateDeposited: h.dateDeposited,
        dueDate: h.dueDate,
        status: DepositStatus.values.firstWhere((e) => e.name == h.status),
        closureType: h.closureType == null
            ? null
            : ClosureType.values.firstWhere((e) => e.name == h.closureType),
        previousDepositId: h.previousDepositId,
        nextDepositId: h.nextDepositId,
        chainId: h.chainId,
        createdAt: h.createdAt,
        updatedAt: h.updatedAt,
        notes: h.notes,
        attachments: h.attachments
            .map((a) => Attachment(
                  id: a.id,
                  storagePath: a.storagePath,
                  kind:
                      AttachmentKind.values.firstWhere((e) => e.name == a.kind),
                  ocrVersion: a.ocrVersion,
                  fieldsExtracted: a.fieldsExtracted,
                ))
            .toList(),
      );

  @override
  Future<Deposit> createDeposit(Deposit deposit) async {
    print('💾 createDeposit called - Original ID: ${deposit.id}');
    final id = deposit.id.isEmpty ? _uuid.v4() : deposit.id;
    print('💾 Final deposit ID: $id');
    final toSave = deposit.copyWith(
        id: id, createdAt: DateTime.now(), updatedAt: DateTime.now());
    print('💾 Saving deposit to Hive box...');
    await _box.put(id, _toHive(toSave));
    print('✅ Deposit saved to Hive box');
    return toSave;
  }

  @override
  Future<void> deleteDeposit(String id) async {
    await _box.delete(id);
  }

  @override
  Future<List<Deposit>> getAllDeposits() async {
    final items = _box.values.map(_fromHive).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return items;
  }

  @override
  Future<Deposit?> getDepositById(String id) async {
    final h = _box.get(id);
    return h == null ? null : _fromHive(h);
  }

  @override
  Future<Deposit?> getDepositBySrNo(String srNo) async {
    try {
      return _box.values.map(_fromHive).firstWhere((d) => d.srNo == srNo);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Deposit>> getDepositsByBank(String bankName) async {
    final q = bankName.toLowerCase();
    return _box.values
        .map(_fromHive)
        .where((d) => d.bankName.toLowerCase().contains(q))
        .toList();
  }

  @override
  Future<List<Deposit>> getDepositsByHolder(String holderName) async {
    final q = holderName.toLowerCase();
    return _box.values
        .map(_fromHive)
        .where(
            (d) => d.holders.any((holder) => holder.toLowerCase().contains(q)))
        .toList();
  }

  @override
  Future<List<Deposit>> getDepositsByStatus(DepositStatus status) async {
    return _box.values.map(_fromHive).where((d) => d.status == status).toList();
  }

  @override
  Future<List<Deposit>> getDepositsDueSoon(int days) async {
    return _box.values.map(_fromHive).where((d) => d.isDueSoon(days)).toList();
  }

  @override
  Future<List<Deposit>> getDepositsInChain(String chainId) async {
    return _box.values
        .map(_fromHive)
        .where((d) => d.chainId == chainId)
        .toList();
  }

  @override
  Future<String> getNextSerialNumber() async {
    if (_box.isEmpty) return '1';
    final nums = _box.values.map((h) => int.tryParse(h.srNo) ?? 0).toList();
    final next = (nums.isEmpty ? 0 : (nums..sort()).last) + 1;
    return next.toString();
  }

  @override
  Future<List<Deposit>> searchDeposits({
    String? query,
    DepositStatus? status,
    String? holderName,
    String? bankName,
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    Iterable<Deposit> results = _box.values.map(_fromHive);
    if (query != null && query.trim().isNotEmpty) {
      final q = query.toLowerCase();
      results = results.where((d) =>
          d.srNo.toLowerCase().contains(q) ||
          d.bankName.toLowerCase().contains(q) ||
          d.holders.any((holder) => holder.toLowerCase().contains(q)) ||
          d.accountNumber.toLowerCase().contains(q) ||
          d.fdrNo.toLowerCase().contains(q));
    }
    if (status != null) {
      results = results.where((d) => d.status == status);
    }
    if (holderName != null && holderName.isNotEmpty) {
      final q = holderName.toLowerCase();
      results = results.where(
          (d) => d.holders.any((holder) => holder.toLowerCase().contains(q)));
    }
    if (bankName != null && bankName.isNotEmpty) {
      final q = bankName.toLowerCase();
      results = results.where((d) => d.bankName.toLowerCase().contains(q));
    }
    if (fromDate != null) {
      results = results.where((d) => !d.dateDeposited.isBefore(fromDate));
    }
    if (toDate != null) {
      results = results.where((d) => !d.dateDeposited.isAfter(toDate));
    }
    return results.toList();
  }

  @override
  Future<void> linkDeposits(String fromDepositId, String toDepositId) async {
    final from = await getDepositById(fromDepositId);
    final to = await getDepositById(toDepositId);
    if (from == null || to == null) return;
    final updatedFrom = from.linkToNext(to.id);
    final updatedTo = to.linkFromPrevious(from.id, from.chainId ?? from.id);
    await _box.put(updatedFrom.id, _toHive(updatedFrom));
    await _box.put(updatedTo.id, _toHive(updatedTo));
  }

  @override
  Future<Deposit> updateDeposit(Deposit deposit) async {
    final updated = deposit.copyWith(updatedAt: DateTime.now());
    await _box.put(updated.id, _toHive(updated));
    return updated;
  }

  @override
  Future<void> syncWithCloud() async {}

  @override
  Future<int> getOfflineChangesCount() async => 0;

  @override
  Future<DepositStatistics> getStatistics() async {
    final all = _box.values.map(_fromHive).toList();
    final totalDeposits = all.length;
    final active = all.where((d) => d.status == DepositStatus.active).length;
    final matured = all.where((d) => d.status == DepositStatus.matured).length;
    final closed = all.where((d) => d.status == DepositStatus.closed).length;
    final totalAmountDeposited =
        all.fold<double>(0, (s, d) => s + d.amountDeposited);
    final totalDueAmount = all.fold<double>(0, (s, d) => s + d.dueAmount);
    final totalInterestEarned =
        all.fold<double>(0, (s, d) => s + d.interestAmount);
    final depositsDueSoon = all.where((d) => d.isDueSoon(3)).length;
    final chainsCount = all.map((d) => d.chainId ?? d.id).toSet().length;
    return DepositStatistics(
      totalDeposits: totalDeposits,
      activeDeposits: active,
      maturedDeposits: matured,
      closedDeposits: closed,
      totalAmountDeposited: totalAmountDeposited,
      totalDueAmount: totalDueAmount,
      totalInterestEarned: totalInterestEarned,
      depositsDueSoon: depositsDueSoon,
      chainsCount: chainsCount,
    );
  }
}
