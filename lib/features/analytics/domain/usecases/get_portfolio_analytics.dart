import '../entities/portfolio_analytics.dart';
import '../repositories/analytics_repository.dart';

class AnalyticsUseCase {
  final AnalyticsRepository _repository;

  const AnalyticsUseCase(this._repository);

  /// Get complete portfolio analytics
  Future<PortfolioAnalytics> getPortfolioAnalytics({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    return await _repository.getPortfolioAnalytics(
      startDate: startDate,
      endDate: endDate,
    );
  }

  /// Get portfolio summary statistics
  Future<PortfolioSummary> getPortfolioSummary() async {
    return await _repository.getPortfolioSummary();
  }

  /// Get bank-wise distribution for pie charts
  Future<List<BankDistribution>> getBankDistribution() async {
    return await _repository.getBankDistribution();
  }

  /// Get status-wise distribution
  Future<List<StatusDistribution>> getStatusDistribution() async {
    return await _repository.getStatusDistribution();
  }

  /// Get monthly trends for line charts
  Future<List<MonthlyTrend>> getMonthlyTrends({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    return await _repository.getMonthlyTrends(
      startDate: startDate,
      endDate: endDate,
    );
  }

  /// Get maturity timeline
  Future<List<MaturityTimeline>> getMaturityTimeline({
    int monthsAhead = 12,
  }) async {
    return await _repository.getMaturityTimeline(monthsAhead: monthsAhead);
  }

  /// Get performance metrics
  Future<PerformanceMetrics> getPerformanceMetrics() async {
    return await _repository.getPerformanceMetrics();
  }

  /// Get holder-wise distribution
  Future<List<HolderDistribution>> getHolderDistribution() async {
    return await _repository.getHolderDistribution();
  }

  /// Get top performing deposits
  Future<List<TopPerformer>> getTopPerformers({int limit = 5}) async {
    return await _repository.getTopPerformers(limit: limit);
  }

  /// Refresh analytics cache
  Future<void> refreshAnalytics() async {
    await _repository.refreshAnalytics();
  }

  /// Create chart data points from bank distribution
  List<ChartDataPoint> getBankChartData(List<BankDistribution> banks) {
    return banks.map((bank) => ChartDataPoint(
      label: bank.bankName,
      value: bank.percentage,
      color: bank.color,
      subtitle: '${bank.depositCount} deposits',
    )).toList();
  }

  /// Create time series data from monthly trends
  List<TimeSeriesDataPoint> getTrendChartData(List<MonthlyTrend> trends) {
    return trends.map((trend) => TimeSeriesDataPoint(
      date: trend.month,
      value: trend.cumulativeAmount,
      label: '₹${trend.cumulativeAmount.toStringAsFixed(0)}',
    )).toList();
  }
}
