import '../entities/search_filters.dart';
import '../entities/search_result.dart';
import '../repositories/search_repository.dart';
import '../../../deposits/domain/entities/deposit.dart';

class SearchUseCase {
  final SearchRepository _searchRepository;

  const SearchUseCase(this._searchRepository);

  /// Perform search with filters
  Future<SearchResult> searchDeposits(SearchFilters filters) async {
    return await _searchRepository.searchDeposits(filters);
  }

  /// Get search suggestions
  Future<List<String>> getSearchSuggestions(String query) async {
    if (query.trim().isEmpty) return [];
    return await _searchRepository.getSearchSuggestions(query);
  }

  /// Get filter options for UI
  Future<SearchFilterOptions> getFilterOptions() async {
    return await _searchRepository.getFilterOptions();
  }

  /// Create quick search filters for common scenarios
  SearchFilters createQuickFilter({
    String? query,
    DepositStatus? status,
    bool? dueSoon,
    String? bank,
    String? holder,
  }) {
    var filters = SearchFilters(query: query ?? '');

    if (status != null) {
      filters = filters.copyWith(statusFilters: [status]);
    }

    if (dueSoon == true) {
      final now = DateTime.now();
      final dueDate = now.add(const Duration(days: 30)); // Due within 30 days
      filters = filters.copyWith(
        maturityFromDate: now,
        maturityToDate: dueDate,
      );
    }

    if (bank != null) {
      filters = filters.copyWith(bankFilters: [bank]);
    }

    if (holder != null) {
      filters = filters.copyWith(holderFilters: [holder]);
    }

    return filters;
  }

  /// Create date range filter
  SearchFilters createDateRangeFilter(
    SearchFilters currentFilters, {
    DateTime? depositFromDate,
    DateTime? depositToDate,
    DateTime? maturityFromDate,
    DateTime? maturityToDate,
  }) {
    return currentFilters.copyWith(
      fromDate: depositFromDate,
      toDate: depositToDate,
      maturityFromDate: maturityFromDate,
      maturityToDate: maturityToDate,
    );
  }

  /// Create amount range filter
  SearchFilters createAmountRangeFilter(
    SearchFilters currentFilters, {
    double? minDeposited,
    double? maxDeposited,
    double? minDue,
    double? maxDue,
  }) {
    return currentFilters.copyWith(
      minAmount: minDeposited,
      maxAmount: maxDeposited,
      minDueAmount: minDue,
      maxDueAmount: maxDue,
    );
  }

  /// Validate search filters
  String? validateFilters(SearchFilters filters) {
    // Date validation
    if (filters.fromDate != null &&
        filters.toDate != null &&
        filters.fromDate!.isAfter(filters.toDate!)) {
      return 'Deposit from date cannot be after to date';
    }

    if (filters.maturityFromDate != null &&
        filters.maturityToDate != null &&
        filters.maturityFromDate!.isAfter(filters.maturityToDate!)) {
      return 'Maturity from date cannot be after to date';
    }

    // Amount validation
    if (filters.minAmount != null &&
        filters.maxAmount != null &&
        filters.minAmount! > filters.maxAmount!) {
      return 'Minimum amount cannot be greater than maximum amount';
    }

    if (filters.minDueAmount != null &&
        filters.maxDueAmount != null &&
        filters.minDueAmount! > filters.maxDueAmount!) {
      return 'Minimum due amount cannot be greater than maximum due amount';
    }

    // Amount range validation
    if (filters.minAmount != null && filters.minAmount! < 0) {
      return 'Minimum amount cannot be negative';
    }

    if (filters.maxAmount != null && filters.maxAmount! < 0) {
      return 'Maximum amount cannot be negative';
    }

    return null; // Valid
  }

  /// Save search as preset
  Future<void> saveSearchPreset(String name, SearchFilters filters) async {
    final validation = validateFilters(filters);
    if (validation != null) {
      throw ArgumentError(validation);
    }

    await _searchRepository.saveSearchPreset(name, filters);
  }

  /// Get saved search presets
  Future<List<SearchPreset>> getSearchPresets() async {
    return await _searchRepository.getSearchPresets();
  }

  /// Delete search preset
  Future<void> deleteSearchPreset(String id) async {
    await _searchRepository.deleteSearchPreset(id);
  }

  /// Add search to history
  Future<void> addToHistory(String query) async {
    if (query.trim().isNotEmpty) {
      await _searchRepository.addToSearchHistory(query.trim());
    }
  }

  /// Get search history
  Future<List<String>> getSearchHistory() async {
    return await _searchRepository.getSearchHistory();
  }

  /// Clear search history
  Future<void> clearSearchHistory() async {
    await _searchRepository.clearSearchHistory();
  }
}
