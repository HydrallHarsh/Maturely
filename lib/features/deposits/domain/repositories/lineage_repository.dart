import '../entities/deposit.dart';
import '../entities/deposit_chain.dart';

abstract class LineageRepository {
  /// Create a new deposit chain
  Future<DepositChain> createChain({
    required String name,
    String? description,
  });

  /// Get all deposit chains
  Future<List<DepositChain>> getAllChains();

  /// Get a specific chain by ID
  Future<DepositChain?> getChain(String chainId);

  /// Update a chain
  Future<DepositChain> updateChain(DepositChain chain);

  /// Delete a chain
  Future<void> deleteChain(String chainId);

  /// Link two deposits (parent -> child)
  Future<ChainLink> linkDeposits({
    required String parentDepositId,
    required String childDepositId,
    required double reinvestedAmount,
    String? notes,
  });

  /// Unlink deposits
  Future<void> unlinkDeposits(String parentDepositId, String childDepositId);

  /// Get all links for a deposit
  Future<List<ChainLink>> getDepositLinks(String depositId);

  /// Get the chain for a specific deposit
  Future<DepositChain?> getDepositChain(String depositId);

  /// Get the lineage (family tree) for a deposit
  Future<List<Deposit>> getDepositLineage(String depositId);

  /// Get chain statistics
  Future<Map<String, dynamic>> getChainStatistics(String chainId);

  /// Get all chains with their deposits
  Future<List<DepositChain>> getChainsWithDeposits();

  /// Add deposit to chain
  Future<DepositChain> addDepositToChain(String chainId, String depositId);

  /// Remove deposit from chain
  Future<DepositChain> removeDepositFromChain(String chainId, String depositId);

  /// Get orphaned deposits (not in any chain)
  Future<List<Deposit>> getOrphanedDeposits();

  /// Merge two chains
  Future<DepositChain> mergeChains(String sourceChainId, String targetChainId);

  /// Split a chain at a specific deposit
  Future<List<DepositChain>> splitChain(
      String chainId, String splitAtDepositId);
}
