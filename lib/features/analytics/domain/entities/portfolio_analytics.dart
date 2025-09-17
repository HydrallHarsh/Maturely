import 'dart:math' as math;
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../deposits/domain/entities/deposit.dart';

part 'portfolio_analytics.freezed.dart';

@freezed
class PortfolioAnalytics with _$PortfolioAnalytics {
  const factory PortfolioAnalytics({
    required PortfolioSummary summary,
    required List<BankDistribution> bankDistribution,
    required List<StatusDistribution> statusDistribution,
    required List<MonthlyTrend> monthlyTrends,
    required List<MaturityTimeline> maturityTimeline,
    required PerformanceMetrics performance,
    required List<HolderDistribution> holderDistribution,
    @Default([]) List<TopPerformer> topPerformers,
  }) = _PortfolioAnalytics;

  const PortfolioAnalytics._();

  /// Get total portfolio value
  double get totalPortfolioValue => summary.totalDueAmount;

  /// Get average deposit amount
  double get averageDepositAmount => summary.totalDeposits > 0
      ? summary.totalAmountDeposited / summary.totalDeposits
      : 0;

  /// Get portfolio growth percentage
  double get portfolioGrowthPercent {
    if (summary.totalAmountDeposited == 0) return 0;
    return ((summary.totalDueAmount - summary.totalAmountDeposited) /
            summary.totalAmountDeposited) *
        100;
  }

  /// Get diversification score (0-100 based on bank distribution)
  double get diversificationScore {
    if (bankDistribution.isEmpty) return 0;

    // Calculate entropy-based diversification score
    final total =
        bankDistribution.fold(0.0, (sum, bank) => sum + bank.percentage);
    if (total == 0) return 0;

    double entropy = 0;
    for (final bank in bankDistribution) {
      if (bank.percentage > 0) {
        final p = bank.percentage / total;
        entropy -= p * (math.log(p) / math.log(2));
      }
    }

    final maxEntropy = math.log(bankDistribution.length) / math.log(2);
    return maxEntropy > 0 ? (entropy / maxEntropy) * 100 : 0;
  }
}

@freezed
class PortfolioSummary with _$PortfolioSummary {
  const factory PortfolioSummary({
    required int totalDeposits,
    required int activeDeposits,
    required int maturedDeposits,
    required int closedDeposits,
    required double totalAmountDeposited,
    required double totalDueAmount,
    required double totalInterestEarned,
    required int depositsDueSoon,
    required int uniqueBanks,
    required int uniqueHolders,
    required DateTime? earliestDeposit,
    required DateTime? latestDeposit,
  }) = _PortfolioSummary;
}

@freezed
class BankDistribution with _$BankDistribution {
  const factory BankDistribution({
    required String bankName,
    required int depositCount,
    required double totalAmount,
    required double percentage,
    required String color,
  }) = _BankDistribution;
}

@freezed
class StatusDistribution with _$StatusDistribution {
  const factory StatusDistribution({
    required DepositStatus status,
    required int count,
    required double amount,
    required double percentage,
    required String color,
  }) = _StatusDistribution;
}

@freezed
class MonthlyTrend with _$MonthlyTrend {
  const factory MonthlyTrend({
    required DateTime month,
    required double depositsAmount,
    required double maturityAmount,
    required int depositCount,
    required int maturityCount,
    required double cumulativeAmount,
  }) = _MonthlyTrend;
}

@freezed
class MaturityTimeline with _$MaturityTimeline {
  const factory MaturityTimeline({
    required DateTime month,
    required double amount,
    required int count,
    required List<String> depositIds,
  }) = _MaturityTimeline;
}

@freezed
class PerformanceMetrics with _$PerformanceMetrics {
  const factory PerformanceMetrics({
    required double averageInterestRate,
    required double totalInterestEarned,
    required double projectedAnnualIncome,
    required double averageMaturityPeriod,
    required double riskScore,
    required String riskLevel,
  }) = _PerformanceMetrics;
}

@freezed
class HolderDistribution with _$HolderDistribution {
  const factory HolderDistribution({
    required String holderName,
    required int depositCount,
    required double totalAmount,
    required double percentage,
  }) = _HolderDistribution;
}

@freezed
class TopPerformer with _$TopPerformer {
  const factory TopPerformer({
    required String depositId,
    required String title,
    required double value,
    required String metric,
    required String displayValue,
  }) = _TopPerformer;
}

// Chart data models for UI
@freezed
class ChartDataPoint with _$ChartDataPoint {
  const factory ChartDataPoint({
    required String label,
    required double value,
    required String color,
    @Default('') String subtitle,
  }) = _ChartDataPoint;
}

@freezed
class TimeSeriesDataPoint with _$TimeSeriesDataPoint {
  const factory TimeSeriesDataPoint({
    required DateTime date,
    required double value,
    @Default('') String label,
  }) = _TimeSeriesDataPoint;
}
