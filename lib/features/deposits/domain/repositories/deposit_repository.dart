import '../entities/deposit.dart';

abstract class DepositRepository {
  /// Get all deposits
  Future<List<Deposit>> getAllDeposits();

  /// Get deposit by ID
  Future<Deposit?> getDepositById(String id);

  /// Get deposit by serial number
  Future<Deposit?> getDepositBySrNo(String srNo);

  /// Get deposits by status
  Future<List<Deposit>> getDepositsByStatus(DepositStatus status);

  /// Get deposits due soon (within specified days)
  Future<List<Deposit>> getDepositsDueSoon(int days);

  /// Get deposits by holder name
  Future<List<Deposit>> getDepositsByHolder(String holderName);

  /// Get deposits by bank name
  Future<List<Deposit>> getDepositsByBank(String bankName);

  /// Get deposits in a chain
  Future<List<Deposit>> getDepositsInChain(String chainId);

  /// Search deposits by various criteria
  Future<List<Deposit>> searchDeposits({
    String? query,
    DepositStatus? status,
    String? holderName,
    String? bankName,
    DateTime? fromDate,
    DateTime? toDate,
  });

  /// Create a new deposit
  Future<Deposit> createDeposit(Deposit deposit);

  /// Update an existing deposit
  Future<Deposit> updateDeposit(Deposit deposit);

  /// Delete a deposit
  Future<void> deleteDeposit(String id);

  /// Link two deposits (create chain)
  Future<void> linkDeposits(String fromDepositId, String toDepositId);

  /// Get the next available serial number
  Future<String> getNextSerialNumber();

  /// Get statistics
  Future<DepositStatistics> getStatistics();

  /// Sync with cloud (if online)
  Future<void> syncWithCloud();

  /// Get offline changes count
  Future<int> getOfflineChangesCount();
}

class DepositStatistics {
  final int totalDeposits;
  final int activeDeposits;
  final int maturedDeposits;
  final int closedDeposits;
  final double totalAmountDeposited;
  final double totalDueAmount;
  final double totalInterestEarned;
  final int depositsDueSoon;
  final int chainsCount;

  const DepositStatistics({
    required this.totalDeposits,
    required this.activeDeposits,
    required this.maturedDeposits,
    required this.closedDeposits,
    required this.totalAmountDeposited,
    required this.totalDueAmount,
    required this.totalInterestEarned,
    required this.depositsDueSoon,
    required this.chainsCount,
  });
}
