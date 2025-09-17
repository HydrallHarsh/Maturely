import '../entities/portfolio_analytics.dart';

abstract class AnalyticsRepository {
  /// Generate complete portfolio analytics
  Future<PortfolioAnalytics> getPortfolioAnalytics({
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Get portfolio summary statistics
  Future<PortfolioSummary> getPortfolioSummary();

  /// Get bank-wise distribution
  Future<List<BankDistribution>> getBankDistribution();

  /// Get status-wise distribution
  Future<List<StatusDistribution>> getStatusDistribution();

  /// Get monthly trends over time
  Future<List<MonthlyTrend>> getMonthlyTrends({
    DateTime? startDate,
    DateTime? endDate,
  });

  /// Get maturity timeline
  Future<List<MaturityTimeline>> getMaturityTimeline({
    int monthsAhead = 12,
  });

  /// Get performance metrics
  Future<PerformanceMetrics> getPerformanceMetrics();

  /// Get holder-wise distribution
  Future<List<HolderDistribution>> getHolderDistribution();

  /// Get top performing deposits
  Future<List<TopPerformer>> getTopPerformers({
    int limit = 5,
  });

  /// Refresh analytics cache
  Future<void> refreshAnalytics();
}
