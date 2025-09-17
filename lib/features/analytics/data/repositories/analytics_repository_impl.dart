import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../domain/entities/portfolio_analytics.dart';
import '../../domain/repositories/analytics_repository.dart';
import '../../../deposits/domain/entities/deposit.dart';
import '../../../deposits/domain/repositories/deposit_repository.dart';

class AnalyticsRepositoryImpl implements AnalyticsRepository {
  final DepositRepository _depositRepository;

  // Predefined color palette for charts
  static const List<Color> _chartColors = [
    Color(0xFF2196F3), // Blue
    Color(0xFF4CAF50), // Green
    Color(0xFFF44336), // Red
    Color(0xFFFF9800), // Orange
    Color(0xFF9C27B0), // Purple
    Color(0xFF00BCD4), // Cyan
    Color(0xFFFFEB3B), // Yellow
    Color(0xFF795548), // Brown
    Color(0xFF607D8B), // Blue Grey
    Color(0xFFE91E63), // Pink
  ];

  const AnalyticsRepositoryImpl(this._depositRepository);

  @override
  Future<PortfolioAnalytics> getPortfolioAnalytics({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final deposits = await _depositRepository.getAllDeposits();
      final filteredDeposits =
          _filterDepositsByDate(deposits, startDate, endDate);

      final summary = await _calculatePortfolioSummary(deposits);
      final bankDistribution = await _calculateBankDistribution(deposits);
      final statusDistribution = await _calculateStatusDistribution(deposits);
      final monthlyTrends =
          await _calculateMonthlyTrends(filteredDeposits, startDate, endDate);
      final maturityTimeline = await _calculateMaturityTimeline(deposits);
      final performance = await _calculatePerformanceMetrics(deposits);
      final holderDistribution = await _calculateHolderDistribution(deposits);
      final topPerformers = await _calculateTopPerformers(deposits);

      return PortfolioAnalytics(
        summary: summary,
        bankDistribution: bankDistribution,
        statusDistribution: statusDistribution,
        monthlyTrends: monthlyTrends,
        maturityTimeline: maturityTimeline,
        performance: performance,
        holderDistribution: holderDistribution,
        topPerformers: topPerformers,
      );
    } catch (e) {
      throw Exception('Failed to generate portfolio analytics: $e');
    }
  }

  @override
  Future<PortfolioSummary> getPortfolioSummary() async {
    final deposits = await _depositRepository.getAllDeposits();
    return await _calculatePortfolioSummary(deposits);
  }

  @override
  Future<List<BankDistribution>> getBankDistribution() async {
    final deposits = await _depositRepository.getAllDeposits();
    return await _calculateBankDistribution(deposits);
  }

  @override
  Future<List<StatusDistribution>> getStatusDistribution() async {
    final deposits = await _depositRepository.getAllDeposits();
    return await _calculateStatusDistribution(deposits);
  }

  @override
  Future<List<MonthlyTrend>> getMonthlyTrends({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    final deposits = await _depositRepository.getAllDeposits();
    final filteredDeposits =
        _filterDepositsByDate(deposits, startDate, endDate);
    return await _calculateMonthlyTrends(filteredDeposits, startDate, endDate);
  }

  @override
  Future<List<MaturityTimeline>> getMaturityTimeline({
    int monthsAhead = 12,
  }) async {
    final deposits = await _depositRepository.getAllDeposits();
    return await _calculateMaturityTimeline(deposits, monthsAhead: monthsAhead);
  }

  @override
  Future<PerformanceMetrics> getPerformanceMetrics() async {
    final deposits = await _depositRepository.getAllDeposits();
    return await _calculatePerformanceMetrics(deposits);
  }

  @override
  Future<List<HolderDistribution>> getHolderDistribution() async {
    final deposits = await _depositRepository.getAllDeposits();
    return await _calculateHolderDistribution(deposits);
  }

  @override
  Future<List<TopPerformer>> getTopPerformers({int limit = 5}) async {
    final deposits = await _depositRepository.getAllDeposits();
    return await _calculateTopPerformers(deposits, limit: limit);
  }

  @override
  Future<void> refreshAnalytics() async {
    // Analytics are computed on-demand, so no caching to refresh
    // This could be extended to clear any future cache if implemented
  }

  // Private calculation methods

  List<Deposit> _filterDepositsByDate(
      List<Deposit> deposits, DateTime? startDate, DateTime? endDate) {
    return deposits.where((deposit) {
      final depositDate = deposit.dateDeposited;

      if (startDate != null && depositDate.isBefore(startDate)) {
        return false;
      }

      if (endDate != null && depositDate.isAfter(endDate)) {
        return false;
      }

      return true;
    }).toList();
  }

  Future<PortfolioSummary> _calculatePortfolioSummary(
      List<Deposit> deposits) async {
    final totalDeposits = deposits.length;
    final activeDeposits =
        deposits.where((d) => d.status == DepositStatus.active).length;
    final maturedDeposits =
        deposits.where((d) => d.status == DepositStatus.matured).length;
    final closedDeposits =
        deposits.where((d) => d.status == DepositStatus.closed).length;

    final totalAmountDeposited =
        deposits.fold(0.0, (sum, d) => sum + d.amountDeposited);
    final totalDueAmount = deposits.fold(0.0, (sum, d) => sum + d.dueAmount);
    final totalInterestEarned = totalDueAmount - totalAmountDeposited;

    final now = DateTime.now();
    final depositsDueSoon = deposits.where((d) {
      return d.status == DepositStatus.active &&
          d.dueDate.difference(now).inDays <= 30;
    }).length;

    final uniqueBanks = deposits.map((d) => d.bankName).toSet().length;
    final allHolders = deposits.expand((d) => d.holders).toSet();
    final uniqueHolders = allHolders.length;

    final dates = deposits.map((d) => d.dateDeposited).toList();
    dates.sort();

    return PortfolioSummary(
      totalDeposits: totalDeposits,
      activeDeposits: activeDeposits,
      maturedDeposits: maturedDeposits,
      closedDeposits: closedDeposits,
      totalAmountDeposited: totalAmountDeposited,
      totalDueAmount: totalDueAmount,
      totalInterestEarned: totalInterestEarned,
      depositsDueSoon: depositsDueSoon,
      uniqueBanks: uniqueBanks,
      uniqueHolders: uniqueHolders,
      earliestDeposit: dates.isNotEmpty ? dates.first : null,
      latestDeposit: dates.isNotEmpty ? dates.last : null,
    );
  }

  Future<List<BankDistribution>> _calculateBankDistribution(
      List<Deposit> deposits) async {
    final bankData = <String, List<Deposit>>{};

    for (final deposit in deposits) {
      bankData.putIfAbsent(deposit.bankName, () => []).add(deposit);
    }

    final totalAmount = deposits.fold(0.0, (sum, d) => sum + d.amountDeposited);
    final distributions = <BankDistribution>[];

    int colorIndex = 0;
    for (final entry in bankData.entries) {
      final bankDeposits = entry.value;
      final bankAmount =
          bankDeposits.fold(0.0, (sum, d) => sum + d.amountDeposited);
      final percentage = totalAmount > 0 ? (bankAmount / totalAmount) * 100 : 0;

      distributions.add(BankDistribution(
        bankName: entry.key,
        depositCount: bankDeposits.length,
        totalAmount: bankAmount,
        percentage: percentage.toDouble(),
        color: _chartColors[colorIndex % _chartColors.length].toHex(),
      ));

      colorIndex++;
    }

    distributions.sort((a, b) => b.totalAmount.compareTo(a.totalAmount));
    return distributions;
  }

  Future<List<StatusDistribution>> _calculateStatusDistribution(
      List<Deposit> deposits) async {
    final statusData = <DepositStatus, List<Deposit>>{};

    for (final deposit in deposits) {
      statusData.putIfAbsent(deposit.status, () => []).add(deposit);
    }

    final totalAmount = deposits.fold(0.0, (sum, d) => sum + d.amountDeposited);
    final distributions = <StatusDistribution>[];

    final statusColors = {
      DepositStatus.active: const Color(0xFF4CAF50).toHex(),
      DepositStatus.matured: const Color(0xFF2196F3).toHex(),
      DepositStatus.closed: const Color(0xFF9E9E9E).toHex(),
    };

    for (final entry in statusData.entries) {
      final statusDeposits = entry.value;
      final statusAmount =
          statusDeposits.fold(0.0, (sum, d) => sum + d.amountDeposited);
      final percentage =
          totalAmount > 0 ? (statusAmount / totalAmount) * 100 : 0;

      distributions.add(StatusDistribution(
        status: entry.key,
        count: statusDeposits.length,
        amount: statusAmount,
        percentage: percentage.toDouble(),
        color: statusColors[entry.key] ?? const Color(0xFF9E9E9E).toHex(),
      ));
    }

    return distributions;
  }

  Future<List<MonthlyTrend>> _calculateMonthlyTrends(
    List<Deposit> deposits,
    DateTime? startDate,
    DateTime? endDate,
  ) async {
    final now = DateTime.now();
    final start = startDate ?? DateTime(now.year - 1, now.month);
    final end = endDate ?? now;

    final trends = <MonthlyTrend>[];
    var current = DateTime(start.year, start.month);
    var cumulativeAmount = 0.0;

    while (current.isBefore(end) ||
        current.month == end.month && current.year == end.year) {
      final monthDeposits = deposits
          .where((d) =>
              d.dateDeposited.year == current.year &&
              d.dateDeposited.month == current.month)
          .toList();

      final monthMaturities = deposits
          .where((d) =>
              d.dueDate.year == current.year &&
              d.dueDate.month == current.month)
          .toList();

      final depositsAmount =
          monthDeposits.fold(0.0, (sum, d) => sum + d.amountDeposited);
      final maturityAmount =
          monthMaturities.fold(0.0, (sum, d) => sum + d.dueAmount);

      cumulativeAmount += depositsAmount;

      trends.add(MonthlyTrend(
        month: current,
        depositsAmount: depositsAmount,
        maturityAmount: maturityAmount,
        depositCount: monthDeposits.length,
        maturityCount: monthMaturities.length,
        cumulativeAmount: cumulativeAmount,
      ));

      current = DateTime(current.year, current.month + 1);
      if (current.month > 12) {
        current = DateTime(current.year + 1, 1);
      }
    }

    return trends;
  }

  Future<List<MaturityTimeline>> _calculateMaturityTimeline(
    List<Deposit> deposits, {
    int monthsAhead = 12,
  }) async {
    final now = DateTime.now();
    final end = DateTime(now.year, now.month + monthsAhead);

    final timeline = <MaturityTimeline>[];
    var current = DateTime(now.year, now.month);

    while (current.isBefore(end)) {
      final monthMaturities = deposits
          .where((d) =>
              d.status == DepositStatus.active &&
              d.dueDate.year == current.year &&
              d.dueDate.month == current.month)
          .toList();

      final amount = monthMaturities.fold(0.0, (sum, d) => sum + d.dueAmount);
      final depositIds = monthMaturities.map((d) => d.id).toList();

      timeline.add(MaturityTimeline(
        month: current,
        amount: amount,
        count: monthMaturities.length,
        depositIds: depositIds,
      ));

      current = DateTime(current.year, current.month + 1);
      if (current.month > 12) {
        current = DateTime(current.year + 1, 1);
      }
    }

    return timeline.where((t) => t.count > 0).toList();
  }

  Future<PerformanceMetrics> _calculatePerformanceMetrics(
      List<Deposit> deposits) async {
    if (deposits.isEmpty) {
      return const PerformanceMetrics(
        averageInterestRate: 0,
        totalInterestEarned: 0,
        projectedAnnualIncome: 0,
        averageMaturityPeriod: 0,
        riskScore: 0,
        riskLevel: 'Low',
      );
    }

    final averageInterestRate =
        deposits.fold(0.0, (sum, d) => sum + d.interestRate) / deposits.length;

    final totalAmountDeposited =
        deposits.fold(0.0, (sum, d) => sum + d.amountDeposited);
    final totalDueAmount = deposits.fold(0.0, (sum, d) => sum + d.dueAmount);
    final totalInterestEarned = totalDueAmount - totalAmountDeposited;

    final activeDeposits =
        deposits.where((d) => d.status == DepositStatus.active).toList();
    final projectedAnnualIncome = activeDeposits.fold(0.0, (sum, d) {
      final annualRate = d.interestRate / 100;
      return sum + (d.amountDeposited * annualRate);
    });

    final averageMaturityPeriod = deposits.fold(0.0, (sum, d) {
          return sum + d.dueDate.difference(d.dateDeposited).inDays / 365.25;
        }) /
        deposits.length;

    // Simple risk calculation based on bank diversification and deposit concentration
    final bankCount = deposits.map((d) => d.bankName).toSet().length;
    final maxBankExposure = _calculateMaxBankExposure(deposits);
    final riskScore =
        _calculateRiskScore(bankCount, maxBankExposure, averageMaturityPeriod);
    final riskLevel = _getRiskLevel(riskScore);

    return PerformanceMetrics(
      averageInterestRate: averageInterestRate,
      totalInterestEarned: totalInterestEarned,
      projectedAnnualIncome: projectedAnnualIncome,
      averageMaturityPeriod: averageMaturityPeriod,
      riskScore: riskScore,
      riskLevel: riskLevel,
    );
  }

  Future<List<HolderDistribution>> _calculateHolderDistribution(
      List<Deposit> deposits) async {
    final holderData = <String, List<Deposit>>{};

    for (final deposit in deposits) {
      for (final holder in deposit.holders) {
        holderData.putIfAbsent(holder, () => []).add(deposit);
      }
    }

    final totalAmount = deposits.fold(0.0, (sum, d) => sum + d.amountDeposited);
    final distributions = <HolderDistribution>[];

    for (final entry in holderData.entries) {
      final holderDeposits = entry.value;
      final holderAmount =
          holderDeposits.fold(0.0, (sum, d) => sum + d.amountDeposited);
      final percentage =
          totalAmount > 0 ? (holderAmount / totalAmount) * 100 : 0;

      distributions.add(HolderDistribution(
        holderName: entry.key,
        depositCount: holderDeposits.length,
        totalAmount: holderAmount,
        percentage: percentage.toDouble(),
      ));
    }

    distributions.sort((a, b) => b.totalAmount.compareTo(a.totalAmount));
    return distributions;
  }

  Future<List<TopPerformer>> _calculateTopPerformers(List<Deposit> deposits,
      {int limit = 5}) async {
    final performers = <TopPerformer>[];

    // Highest interest rate
    final sortedByRate = List<Deposit>.from(deposits)
      ..sort((a, b) => b.interestRate.compareTo(a.interestRate));
    if (sortedByRate.isNotEmpty) {
      final best = sortedByRate.first;
      performers.add(TopPerformer(
        depositId: best.id,
        title: 'Highest Interest Rate',
        value: best.interestRate,
        metric: 'interest_rate',
        displayValue: '${best.interestRate.toStringAsFixed(2)}%',
      ));
    }

    // Largest deposit
    final sortedByAmount = List<Deposit>.from(deposits)
      ..sort((a, b) => b.amountDeposited.compareTo(a.amountDeposited));
    if (sortedByAmount.isNotEmpty) {
      final largest = sortedByAmount.first;
      performers.add(TopPerformer(
        depositId: largest.id,
        title: 'Largest Deposit',
        value: largest.amountDeposited,
        metric: 'amount',
        displayValue: '₹${largest.amountDeposited.toStringAsFixed(0)}',
      ));
    }

    // Highest maturity amount
    final sortedByMaturity = List<Deposit>.from(deposits)
      ..sort((a, b) => b.dueAmount.compareTo(a.dueAmount));
    if (sortedByMaturity.isNotEmpty) {
      final bestMaturity = sortedByMaturity.first;
      performers.add(TopPerformer(
        depositId: bestMaturity.id,
        title: 'Highest Maturity Value',
        value: bestMaturity.dueAmount,
        metric: 'maturity_amount',
        displayValue: '₹${bestMaturity.dueAmount.toStringAsFixed(0)}',
      ));
    }

    return performers.take(limit).toList();
  }

  double _calculateMaxBankExposure(List<Deposit> deposits) {
    final bankAmounts = <String, double>{};
    final totalAmount = deposits.fold(0.0, (sum, d) => sum + d.amountDeposited);

    for (final deposit in deposits) {
      bankAmounts[deposit.bankName] =
          (bankAmounts[deposit.bankName] ?? 0) + deposit.amountDeposited;
    }

    final maxAmount =
        bankAmounts.values.isEmpty ? 0.0 : bankAmounts.values.reduce(math.max);
    return totalAmount > 0 ? (maxAmount / totalAmount) * 100 : 0;
  }

  double _calculateRiskScore(
      int bankCount, double maxBankExposure, double avgMaturityPeriod) {
    // Risk score from 0-100 (higher = more risky)
    double score = 0;

    // Bank diversification (fewer banks = higher risk)
    if (bankCount == 1)
      score += 40;
    else if (bankCount == 2)
      score += 25;
    else if (bankCount <= 4)
      score += 15;
    else
      score += 5;

    // Concentration risk (higher concentration = higher risk)
    if (maxBankExposure > 80)
      score += 30;
    else if (maxBankExposure > 60)
      score += 20;
    else if (maxBankExposure > 40) score += 10;

    // Liquidity risk (longer average maturity = higher risk)
    if (avgMaturityPeriod > 5)
      score += 20;
    else if (avgMaturityPeriod > 3)
      score += 15;
    else if (avgMaturityPeriod > 1)
      score += 10;
    else
      score += 5;

    return math.min(score, 100);
  }

  String _getRiskLevel(double score) {
    if (score <= 25) return 'Low';
    if (score <= 50) return 'Medium';
    if (score <= 75) return 'High';
    return 'Very High';
  }
}

extension on Color {
  String toHex() => '#${value.toRadixString(16).substring(2).toUpperCase()}';
}
