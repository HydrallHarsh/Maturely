import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/deposit.dart';
import '../../domain/entities/deposit_chain.dart';
import '../../domain/repositories/lineage_repository.dart';
import '../../data/repositories/hive_lineage_repository.dart';

// Repository provider
final lineageRepositoryProvider = Provider<LineageRepository>((ref) {
  return HiveLineageRepository();
});

// All chains provider with error handling
final allChainsProvider = FutureProvider<List<DepositChain>>((ref) async {
  try {
    final repository = ref.read(lineageRepositoryProvider);
    return await repository.getAllChains();
  } catch (e) {
    // Return empty list if Hive boxes aren't opened yet
    if (e.toString().contains('Box not found')) {
      return [];
    }
    rethrow;
  }
});

// Chains with deposits provider with error handling
final chainsWithDepositsProvider =
    FutureProvider<List<DepositChain>>((ref) async {
  try {
    print('🔍 chainsWithDepositsProvider called');
    final repository = ref.read(lineageRepositoryProvider);
    final result = await repository.getChainsWithDeposits();
    print('🔍 chainsWithDepositsProvider result: ${result.length} chains');
    return result;
  } catch (e) {
    print('❌ chainsWithDepositsProvider error: $e');
    // Return empty list if Hive boxes aren't opened yet
    if (e.toString().contains('Box not found')) {
      print('⚠️ Box not found, returning empty list');
      return [];
    }
    rethrow;
  }
});

// Orphaned deposits provider with error handling
final orphanedDepositsProvider = FutureProvider<List<Deposit>>((ref) async {
  try {
    final repository = ref.read(lineageRepositoryProvider);
    return await repository.getOrphanedDeposits();
  } catch (e) {
    // Return empty list if Hive boxes aren't opened yet
    if (e.toString().contains('Box not found')) {
      return [];
    }
    rethrow;
  }
});

// Chain statistics provider
final chainStatisticsProvider =
    FutureProvider.family<Map<String, dynamic>, String>((ref, chainId) async {
  final repository = ref.read(lineageRepositoryProvider);
  return await repository.getChainStatistics(chainId);
});

// Deposit lineage provider
final depositLineageProvider =
    FutureProvider.family<List<Deposit>, String>((ref, depositId) async {
  final repository = ref.read(lineageRepositoryProvider);
  return await repository.getDepositLineage(depositId);
});

// Chain by ID provider
final chainByIdProvider =
    FutureProvider.family<DepositChain?, String>((ref, chainId) async {
  final repository = ref.read(lineageRepositoryProvider);
  return await repository.getChain(chainId);
});

// Deposit links provider
final depositLinksProvider =
    FutureProvider.family<List<ChainLink>, String>((ref, depositId) async {
  final repository = ref.read(lineageRepositoryProvider);
  return await repository.getDepositLinks(depositId);
});

// Chain operations notifier
class ChainOperationsNotifier extends StateNotifier<AsyncValue<void>> {
  ChainOperationsNotifier(this._repository)
      : super(const AsyncValue.data(null));

  final LineageRepository _repository;

  Future<void> createChain({
    required String name,
    String? description,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _repository.createChain(name: name, description: description);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      // Handle Hive box not found errors gracefully
      if (error.toString().contains('Box not found')) {
        state = AsyncValue.error(
          'Database not initialized. Please restart the app.',
          stackTrace,
        );
      } else {
        state = AsyncValue.error(error, stackTrace);
      }
    }
  }

  Future<void> updateChain(DepositChain chain) async {
    state = const AsyncValue.loading();
    try {
      await _repository.updateChain(chain);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deleteChain(String chainId) async {
    state = const AsyncValue.loading();
    try {
      await _repository.deleteChain(chainId);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> linkDeposits({
    required String parentDepositId,
    required String childDepositId,
    required double reinvestedAmount,
    String? notes,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _repository.linkDeposits(
        parentDepositId: parentDepositId,
        childDepositId: childDepositId,
        reinvestedAmount: reinvestedAmount,
        notes: notes,
      );
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> unlinkDeposits(
      String parentDepositId, String childDepositId) async {
    state = const AsyncValue.loading();
    try {
      await _repository.unlinkDeposits(parentDepositId, childDepositId);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addDepositToChain(String chainId, String depositId) async {
    state = const AsyncValue.loading();
    try {
      await _repository.addDepositToChain(chainId, depositId);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> removeDepositFromChain(String chainId, String depositId) async {
    state = const AsyncValue.loading();
    try {
      await _repository.removeDepositFromChain(chainId, depositId);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> mergeChains(String sourceChainId, String targetChainId) async {
    state = const AsyncValue.loading();
    try {
      await _repository.mergeChains(sourceChainId, targetChainId);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> splitChain(String chainId, String splitAtDepositId) async {
    state = const AsyncValue.loading();
    try {
      await _repository.splitChain(chainId, splitAtDepositId);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final chainOperationsProvider =
    StateNotifierProvider<ChainOperationsNotifier, AsyncValue<void>>((ref) {
  final repository = ref.read(lineageRepositoryProvider);
  return ChainOperationsNotifier(repository);
});
