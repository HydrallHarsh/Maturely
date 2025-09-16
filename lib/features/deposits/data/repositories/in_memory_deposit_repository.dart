import 'dart:collection';

import 'package:uuid/uuid.dart';

import '../../domain/entities/deposit.dart';
import '../../domain/repositories/deposit_repository.dart';

class InMemoryDepositRepository implements DepositRepository {
  final Map<String, Deposit> _store = HashMap();
  final Uuid _uuid = const Uuid();

  @override
  Future<Deposit> createDeposit(Deposit deposit) async {
    final toSave = deposit.copyWith(
      id: deposit.id.isEmpty ? _uuid.v4() : deposit.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      chainId:
          deposit.chainId?.isNotEmpty == true ? deposit.chainId : deposit.id,
    );
    _store[toSave.id] = toSave;
    return toSave;
  }

  @override
  Future<void> deleteDeposit(String id) async {
    _store.remove(id);
  }

  @override
  Future<List<Deposit>> getAllDeposits() async {
    return _store.values.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  @override
  Future<Deposit?> getDepositById(String id) async {
    return _store[id];
  }

  @override
  Future<Deposit?> getDepositBySrNo(String srNo) async {
    try {
      return _store.values.firstWhere((d) => d.srNo == srNo);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<Deposit>> getDepositsByBank(String bankName) async {
    return _store.values
        .where((d) => d.bankName.toLowerCase().contains(bankName.toLowerCase()))
        .toList();
  }

  @override
  Future<List<Deposit>> getDepositsByHolder(String holderName) async {
    return _store.values
        .where((d) => d.holders.any((holder) =>
            holder.toLowerCase().contains(holderName.toLowerCase())))
        .toList();
  }

  @override
  Future<List<Deposit>> getDepositsByStatus(DepositStatus status) async {
    return _store.values.where((d) => d.status == status).toList();
  }

  @override
  Future<List<Deposit>> getDepositsDueSoon(int days) async {
    return _store.values.where((d) => d.isDueSoon(days)).toList();
  }

  @override
  Future<List<Deposit>> getDepositsInChain(String chainId) async {
    return _store.values.where((d) => d.chainId == chainId).toList();
  }

  @override
  Future<String> getNextSerialNumber() async {
    if (_store.isEmpty) return '1';
    final nums = _store.values.map((d) => int.tryParse(d.srNo) ?? 0).toList();
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
    Iterable<Deposit> results = _store.values;
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
    final from = _store[fromDepositId];
    final to = _store[toDepositId];
    if (from == null || to == null) return;
    final updatedFrom = from.linkToNext(to.id);
    final updatedTo = to.linkFromPrevious(from.id, from.chainId ?? from.id);
    _store[updatedFrom.id] = updatedFrom;
    _store[updatedTo.id] = updatedTo;
  }

  @override
  Future<Deposit> updateDeposit(Deposit deposit) async {
    if (!_store.containsKey(deposit.id)) {
      throw StateError('Deposit not found');
    }
    final updated = deposit.copyWith(updatedAt: DateTime.now());
    _store[deposit.id] = updated;
    return updated;
  }

  @override
  Future<void> syncWithCloud() async {
    // No-op in memory
  }

  @override
  Future<int> getOfflineChangesCount() async {
    // No-op for now
    return 0;
  }

  @override
  Future<DepositStatistics> getStatistics() async {
    final all = _store.values.toList();
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
