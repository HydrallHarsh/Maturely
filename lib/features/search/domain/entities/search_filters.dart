import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../deposits/domain/entities/deposit.dart';

part 'search_filters.freezed.dart';

@freezed
class SearchFilters with _$SearchFilters {
  const factory SearchFilters({
    @Default('') String query,
    @Default([]) List<DepositStatus> statusFilters,
    @Default([]) List<String> bankFilters,
    @Default([]) List<String> holderFilters,
    DateTime? fromDate,
    DateTime? toDate,
    DateTime? maturityFromDate,
    DateTime? maturityToDate,
    double? minAmount,
    double? maxAmount,
    double? minDueAmount,
    double? maxDueAmount,
    @Default(SearchSortBy.dateCreated) SearchSortBy sortBy,
    @Default(SortOrder.descending) SortOrder sortOrder,
  }) = _SearchFilters;

  const SearchFilters._();

  /// Check if any filters are active
  bool get hasActiveFilters {
    return query.isNotEmpty ||
        statusFilters.isNotEmpty ||
        bankFilters.isNotEmpty ||
        holderFilters.isNotEmpty ||
        fromDate != null ||
        toDate != null ||
        maturityFromDate != null ||
        maturityToDate != null ||
        minAmount != null ||
        maxAmount != null ||
        minDueAmount != null ||
        maxDueAmount != null;
  }

  /// Get active filter count for UI
  int get activeFilterCount {
    int count = 0;
    if (query.isNotEmpty) count++;
    if (statusFilters.isNotEmpty) count++;
    if (bankFilters.isNotEmpty) count++;
    if (holderFilters.isNotEmpty) count++;
    if (fromDate != null || toDate != null) count++;
    if (maturityFromDate != null || maturityToDate != null) count++;
    if (minAmount != null || maxAmount != null) count++;
    if (minDueAmount != null || maxDueAmount != null) count++;
    return count;
  }

  /// Clear all filters
  SearchFilters clearAll() {
    return const SearchFilters();
  }

  /// Clear specific filter categories
  SearchFilters clearDateFilters() {
    return copyWith(
      fromDate: null,
      toDate: null,
      maturityFromDate: null,
      maturityToDate: null,
    );
  }

  SearchFilters clearAmountFilters() {
    return copyWith(
      minAmount: null,
      maxAmount: null,
      minDueAmount: null,
      maxDueAmount: null,
    );
  }
}

enum SearchSortBy {
  dateCreated,
  dateDeposited,
  dueDate,
  amount,
  dueAmount,
  bankName,
  holderName,
  srNo,
}

enum SortOrder {
  ascending,
  descending,
}

extension SearchSortByExtension on SearchSortBy {
  String get displayName {
    switch (this) {
      case SearchSortBy.dateCreated:
        return 'Date Created';
      case SearchSortBy.dateDeposited:
        return 'Deposit Date';
      case SearchSortBy.dueDate:
        return 'Due Date';
      case SearchSortBy.amount:
        return 'Amount Deposited';
      case SearchSortBy.dueAmount:
        return 'Due Amount';
      case SearchSortBy.bankName:
        return 'Bank Name';
      case SearchSortBy.holderName:
        return 'Holder Name';
      case SearchSortBy.srNo:
        return 'Serial Number';
    }
  }

  String get shortName {
    switch (this) {
      case SearchSortBy.dateCreated:
        return 'Created';
      case SearchSortBy.dateDeposited:
        return 'Deposited';
      case SearchSortBy.dueDate:
        return 'Due Date';
      case SearchSortBy.amount:
        return 'Amount';
      case SearchSortBy.dueAmount:
        return 'Due Amount';
      case SearchSortBy.bankName:
        return 'Bank';
      case SearchSortBy.holderName:
        return 'Holder';
      case SearchSortBy.srNo:
        return 'Sr No';
    }
  }
}
