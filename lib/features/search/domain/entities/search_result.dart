import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../deposits/domain/entities/deposit.dart';
import 'search_filters.dart';

part 'search_result.freezed.dart';

@freezed
class SearchResult with _$SearchResult {
  const factory SearchResult({
    required List<Deposit> deposits,
    required SearchFilters filters,
    required int totalCount,
    required Duration searchDuration,
    @Default([]) List<String> suggestions,
    @Default({}) Map<String, int> aggregations,
  }) = _SearchResult;

  const SearchResult._();

  /// Check if search returned any results
  bool get hasResults => deposits.isNotEmpty;

  /// Check if search was filtered
  bool get isFiltered => filters.hasActiveFilters;

  /// Get result summary text
  String get summaryText {
    if (totalCount == 0) {
      return isFiltered
          ? 'No deposits match your filters'
          : 'No deposits found';
    }

    final resultText = totalCount == 1 ? 'deposit' : 'deposits';
    if (isFiltered) {
      return '$totalCount $resultText found with filters applied';
    }
    return '$totalCount $resultText found';
  }

  /// Get aggregation by key with default value
  int getAggregation(String key) => aggregations[key] ?? 0;

  /// Get bank distribution from aggregations
  Map<String, int> get bankDistribution {
    return Map.fromEntries(
      aggregations.entries.where((e) => e.key.startsWith('bank:')),
    ).map((key, value) => MapEntry(key.replaceFirst('bank:', ''), value));
  }

  /// Get status distribution from aggregations
  Map<String, int> get statusDistribution {
    return Map.fromEntries(
      aggregations.entries.where((e) => e.key.startsWith('status:')),
    ).map((key, value) => MapEntry(key.replaceFirst('status:', ''), value));
  }

  /// Get holder distribution from aggregations
  Map<String, int> get holderDistribution {
    return Map.fromEntries(
      aggregations.entries.where((e) => e.key.startsWith('holder:')),
    ).map((key, value) => MapEntry(key.replaceFirst('holder:', ''), value));
  }
}
