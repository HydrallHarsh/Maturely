import '../../domain/entities/search_filters.dart';
import '../../domain/entities/search_result.dart';
import '../../domain/repositories/search_repository.dart';
import '../../../deposits/domain/repositories/deposit_repository.dart';
import '../../../deposits/domain/entities/deposit.dart';

class DepositSearchRepository implements SearchRepository {
  final DepositRepository _depositRepository;
  final List<String> _searchHistory = [];
  final List<SearchPreset> _searchPresets = [];

  DepositSearchRepository(this._depositRepository);

  @override
  Future<SearchResult> searchDeposits(SearchFilters filters) async {
    final stopwatch = Stopwatch()..start();

    // Get all deposits
    List<Deposit> allDeposits = await _depositRepository.getAllDeposits();

    // Apply filters
    List<Deposit> filteredDeposits = _applyFilters(allDeposits, filters);

    // Apply sorting
    filteredDeposits =
        _applySorting(filteredDeposits, filters.sortBy, filters.sortOrder);

    // Generate aggregations
    Map<String, int> aggregations =
        _generateAggregations(allDeposits, filteredDeposits);

    // Generate suggestions (simplified - could be enhanced)
    List<String> suggestions = _generateSuggestions(filters.query, allDeposits);

    stopwatch.stop();

    return SearchResult(
      deposits: filteredDeposits,
      filters: filters,
      totalCount: filteredDeposits.length,
      searchDuration: stopwatch.elapsed,
      suggestions: suggestions,
      aggregations: aggregations,
    );
  }

  List<Deposit> _applyFilters(List<Deposit> deposits, SearchFilters filters) {
    return deposits.where((deposit) {
      // Text search in multiple fields
      if (filters.query.isNotEmpty) {
        final query = filters.query.toLowerCase();
        final searchableText = [
          deposit.srNo,
          ...deposit.holders,
          deposit.bankName,
          deposit.accountNumber,
          deposit.fdrNo,
          deposit.notes ?? '',
        ].join(' ').toLowerCase();

        if (!searchableText.contains(query)) return false;
      }

      // Status filters
      if (filters.statusFilters.isNotEmpty &&
          !filters.statusFilters.contains(deposit.status)) {
        return false;
      }

      // Bank filters
      if (filters.bankFilters.isNotEmpty &&
          !filters.bankFilters.any((bank) =>
              deposit.bankName.toLowerCase().contains(bank.toLowerCase()))) {
        return false;
      }

      // Holder filters
      if (filters.holderFilters.isNotEmpty &&
          !filters.holderFilters.any((holder) => deposit.holders
              .any((h) => h.toLowerCase().contains(holder.toLowerCase())))) {
        return false;
      }

      // Date deposited range
      if (filters.fromDate != null &&
          deposit.dateDeposited.isBefore(filters.fromDate!)) {
        return false;
      }
      if (filters.toDate != null &&
          deposit.dateDeposited.isAfter(filters.toDate!)) {
        return false;
      }

      // Maturity date range
      if (filters.maturityFromDate != null &&
          deposit.dueDate.isBefore(filters.maturityFromDate!)) {
        return false;
      }
      if (filters.maturityToDate != null &&
          deposit.dueDate.isAfter(filters.maturityToDate!)) {
        return false;
      }

      // Amount deposited range
      if (filters.minAmount != null &&
          deposit.amountDeposited < filters.minAmount!) {
        return false;
      }
      if (filters.maxAmount != null &&
          deposit.amountDeposited > filters.maxAmount!) {
        return false;
      }

      // Due amount range
      if (filters.minDueAmount != null &&
          deposit.dueAmount < filters.minDueAmount!) {
        return false;
      }
      if (filters.maxDueAmount != null &&
          deposit.dueAmount > filters.maxDueAmount!) {
        return false;
      }

      return true;
    }).toList();
  }

  List<Deposit> _applySorting(
      List<Deposit> deposits, SearchSortBy sortBy, SortOrder sortOrder) {
    deposits.sort((a, b) {
      int comparison;

      switch (sortBy) {
        case SearchSortBy.dateCreated:
          comparison = a.id.compareTo(b.id); // Assuming ID is time-based
          break;
        case SearchSortBy.dateDeposited:
          comparison = a.dateDeposited.compareTo(b.dateDeposited);
          break;
        case SearchSortBy.dueDate:
          comparison = a.dueDate.compareTo(b.dueDate);
          break;
        case SearchSortBy.amount:
          comparison = a.amountDeposited.compareTo(b.amountDeposited);
          break;
        case SearchSortBy.dueAmount:
          comparison = a.dueAmount.compareTo(b.dueAmount);
          break;
        case SearchSortBy.bankName:
          comparison =
              a.bankName.toLowerCase().compareTo(b.bankName.toLowerCase());
          break;
        case SearchSortBy.holderName:
          comparison = a.primaryHolder
              .toLowerCase()
              .compareTo(b.primaryHolder.toLowerCase());
          break;
        case SearchSortBy.srNo:
          comparison = a.srNo.compareTo(b.srNo);
          break;
      }

      return sortOrder == SortOrder.ascending ? comparison : -comparison;
    });

    return deposits;
  }

  Map<String, int> _generateAggregations(
      List<Deposit> allDeposits, List<Deposit> filteredDeposits) {
    final Map<String, int> aggregations = {};

    // Bank aggregations
    final bankCounts = <String, int>{};
    for (final deposit in filteredDeposits) {
      bankCounts[deposit.bankName] = (bankCounts[deposit.bankName] ?? 0) + 1;
    }
    bankCounts.forEach((bank, count) {
      aggregations['bank:$bank'] = count;
    });

    // Status aggregations
    final statusCounts = <String, int>{};
    for (final deposit in filteredDeposits) {
      final status = deposit.status.name;
      statusCounts[status] = (statusCounts[status] ?? 0) + 1;
    }
    statusCounts.forEach((status, count) {
      aggregations['status:$status'] = count;
    });

    // Holder aggregations
    final holderCounts = <String, int>{};
    for (final deposit in filteredDeposits) {
      for (final holder in deposit.holders) {
        holderCounts[holder] = (holderCounts[holder] ?? 0) + 1;
      }
    }
    holderCounts.forEach((holder, count) {
      aggregations['holder:$holder'] = count;
    });

    return aggregations;
  }

  List<String> _generateSuggestions(String query, List<Deposit> allDeposits) {
    if (query.length < 2) return [];

    final suggestions = <String>{};
    final queryLower = query.toLowerCase();

    for (final deposit in allDeposits) {
      // Bank name suggestions
      if (deposit.bankName.toLowerCase().contains(queryLower)) {
        suggestions.add(deposit.bankName);
      }

      // Holder suggestions
      for (final holder in deposit.holders) {
        if (holder.toLowerCase().contains(queryLower)) {
          suggestions.add(holder);
        }
      }

      // Serial number suggestions
      if (deposit.srNo.toLowerCase().contains(queryLower)) {
        suggestions.add(deposit.srNo);
      }

      // FDR number suggestions
      if (deposit.fdrNo.toLowerCase().contains(queryLower)) {
        suggestions.add(deposit.fdrNo);
      }
    }

    return suggestions.take(10).toList();
  }

  @override
  Future<List<String>> getSearchSuggestions(String query) async {
    final allDeposits = await _depositRepository.getAllDeposits();
    return _generateSuggestions(query, allDeposits);
  }

  @override
  Future<SearchFilterOptions> getFilterOptions() async {
    final allDeposits = await _depositRepository.getAllDeposits();

    if (allDeposits.isEmpty) {
      return SearchFilterOptions(
        availableBanks: [],
        availableHolders: [],
        minAmount: 0,
        maxAmount: 0,
        earliestDate: DateTime.now(),
        latestDate: DateTime.now(),
      );
    }

    final banks = allDeposits.map((d) => d.bankName).toSet().toList()..sort();
    final holders = allDeposits.expand((d) => d.holders).toSet().toList()
      ..sort();

    final amounts = allDeposits.map((d) => d.amountDeposited);
    final minAmount = amounts.reduce((a, b) => a < b ? a : b);
    final maxAmount = amounts.reduce((a, b) => a > b ? a : b);

    final dates = allDeposits.map((d) => d.dateDeposited);
    final earliestDate = dates.reduce((a, b) => a.isBefore(b) ? a : b);
    final latestDate = dates.reduce((a, b) => a.isAfter(b) ? a : b);

    return SearchFilterOptions(
      availableBanks: banks,
      availableHolders: holders,
      minAmount: minAmount,
      maxAmount: maxAmount,
      earliestDate: earliestDate,
      latestDate: latestDate,
    );
  }

  @override
  Future<void> saveSearchPreset(String name, SearchFilters filters) async {
    final preset = SearchPreset(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      filters: filters,
      createdAt: DateTime.now(),
    );
    _searchPresets.add(preset);
  }

  @override
  Future<List<SearchPreset>> getSearchPresets() async {
    return List.from(_searchPresets);
  }

  @override
  Future<void> deleteSearchPreset(String id) async {
    _searchPresets.removeWhere((preset) => preset.id == id);
  }

  @override
  Future<List<String>> getSearchHistory() async {
    return List.from(_searchHistory.reversed);
  }

  @override
  Future<void> addToSearchHistory(String query) async {
    _searchHistory.remove(query); // Remove if exists
    _searchHistory.add(query);

    // Keep only last 20 searches
    if (_searchHistory.length > 20) {
      _searchHistory.removeAt(0);
    }
  }

  @override
  Future<void> clearSearchHistory() async {
    _searchHistory.clear();
  }
}
