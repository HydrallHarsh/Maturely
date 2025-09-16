import '../entities/search_filters.dart';
import '../entities/search_result.dart';

abstract class SearchRepository {
  /// Perform search with filters
  Future<SearchResult> searchDeposits(SearchFilters filters);

  /// Get search suggestions based on query
  Future<List<String>> getSearchSuggestions(String query);

  /// Get available filter options
  Future<SearchFilterOptions> getFilterOptions();

  /// Save search filters as preset
  Future<void> saveSearchPreset(String name, SearchFilters filters);

  /// Get saved search presets
  Future<List<SearchPreset>> getSearchPresets();

  /// Delete search preset
  Future<void> deleteSearchPreset(String id);

  /// Get search history
  Future<List<String>> getSearchHistory();

  /// Add to search history
  Future<void> addToSearchHistory(String query);

  /// Clear search history
  Future<void> clearSearchHistory();
}

class SearchFilterOptions {
  final List<String> availableBanks;
  final List<String> availableHolders;
  final double minAmount;
  final double maxAmount;
  final DateTime earliestDate;
  final DateTime latestDate;

  const SearchFilterOptions({
    required this.availableBanks,
    required this.availableHolders,
    required this.minAmount,
    required this.maxAmount,
    required this.earliestDate,
    required this.latestDate,
  });
}

class SearchPreset {
  final String id;
  final String name;
  final SearchFilters filters;
  final DateTime createdAt;

  const SearchPreset({
    required this.id,
    required this.name,
    required this.filters,
    required this.createdAt,
  });
}
