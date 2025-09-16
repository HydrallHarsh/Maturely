import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/hive_deposit_repository.dart';
import '../../domain/entities/deposit.dart';
import '../../domain/repositories/deposit_repository.dart';

final depositRepositoryProvider =
    Provider<DepositRepository>((ref) => HiveDepositRepository());

final depositsListProvider = FutureProvider<List<Deposit>>((ref) {
  final repo = ref.watch(depositRepositoryProvider);
  return repo.getAllDeposits();
});
