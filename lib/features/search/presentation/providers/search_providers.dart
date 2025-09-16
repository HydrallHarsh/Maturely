import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/search_filters.dart';
import '../../domain/entities/search_result.dart';
import '../../domain/repositories/search_repository.dart';
import '../../domain/usecases/search_usecase.dart';
import '../../data/repositories/deposit_search_repository.dart';
import '../../../deposits/presentation/providers/deposit_providers.dart';

// Repository provider
final searchRepositoryProvider = Provider<SearchRepository>((ref) {
  final depositRepository = ref.watch(depositRepositoryProvider);
  return DepositSearchRepository(depositRepository);
});

// Use case provider
final searchUseCaseProvider = Provider<SearchUseCase>((ref) {
  final repository = ref.watch(searchRepositoryProvider);
  return SearchUseCase(repository);
});

// Search filters state
final searchFiltersProvider = StateProvider<SearchFilters>((ref) {
  return const SearchFilters();
});

// Search results provider
final searchResultsProvider = FutureProvider<SearchResult>((ref) async {
  final filters = ref.watch(searchFiltersProvider);
  final useCase = ref.watch(searchUseCaseProvider);

  return await useCase.searchDeposits(filters);
});

// Search suggestions provider
final searchSuggestionsProvider =
    FutureProvider.family<List<String>, String>((ref, query) async {
  final useCase = ref.watch(searchUseCaseProvider);
  return await useCase.getSearchSuggestions(query);
});

// Filter options provider
final searchFilterOptionsProvider =
    FutureProvider<SearchFilterOptions>((ref) async {
  final useCase = ref.watch(searchUseCaseProvider);
  return await useCase.getFilterOptions();
});

// Search presets provider
final searchPresetsProvider = FutureProvider<List<SearchPreset>>((ref) async {
  final useCase = ref.watch(searchUseCaseProvider);
  return await useCase.getSearchPresets();
});

// Search history provider
final searchHistoryProvider = FutureProvider<List<String>>((ref) async {
  final useCase = ref.watch(searchUseCaseProvider);
  return await useCase.getSearchHistory();
});

// Search controller notifier for complex state management
class SearchController extends StateNotifier<SearchState> {
  final SearchUseCase _searchUseCase;
  final Ref _ref;

  SearchController(this._searchUseCase, this._ref)
      : super(const SearchState.initial());

  /// Perform search with current filters
  Future<void> search() async {
    final filters = _ref.read(searchFiltersProvider);

    state = const SearchState.loading();

    try {
      final result = await _searchUseCase.searchDeposits(filters);

      // Add to search history if there's a query
      if (filters.query.isNotEmpty) {
        await _searchUseCase.addToHistory(filters.query);
        _ref.invalidate(searchHistoryProvider);
      }

      state = SearchState.loaded(result);
    } catch (error) {
      state = SearchState.error(error.toString());
    }
  }

  /// Update search filters and trigger search
  Future<void> updateFilters(SearchFilters filters) async {
    _ref.read(searchFiltersProvider.notifier).state = filters;
    await search();
  }

  /// Quick search with text query only
  Future<void> quickSearch(String query) async {
    final filters = _ref.read(searchFiltersProvider).copyWith(query: query);
    await updateFilters(filters);
  }

  /// Clear all filters and search
  Future<void> clearFilters() async {
    await updateFilters(const SearchFilters());
  }

  /// Save current search as preset
  Future<void> saveAsPreset(String name) async {
    try {
      final filters = _ref.read(searchFiltersProvider);
      await _searchUseCase.saveSearchPreset(name, filters);
      _ref.invalidate(searchPresetsProvider);
    } catch (error) {
      // Handle error - could emit to UI
    }
  }

  /// Load saved preset
  Future<void> loadPreset(SearchPreset preset) async {
    await updateFilters(preset.filters);
  }

  /// Delete preset
  Future<void> deletePreset(String presetId) async {
    try {
      await _searchUseCase.deleteSearchPreset(presetId);
      _ref.invalidate(searchPresetsProvider);
    } catch (error) {
      // Handle error
    }
  }

  /// Clear search history
  Future<void> clearHistory() async {
    await _searchUseCase.clearSearchHistory();
    _ref.invalidate(searchHistoryProvider);
  }
}

final searchControllerProvider =
    StateNotifierProvider<SearchController, SearchState>((ref) {
  final useCase = ref.watch(searchUseCaseProvider);
  return SearchController(useCase, ref);
});

// Search state for the controller
sealed class SearchState {
  const SearchState();

  const factory SearchState.initial() = SearchInitial;
  const factory SearchState.loading() = SearchLoading;
  const factory SearchState.loaded(SearchResult result) = SearchLoaded;
  const factory SearchState.error(String message) = SearchError;
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchLoaded extends SearchState {
  final SearchResult result;
  const SearchLoaded(this.result);
}

class SearchError extends SearchState {
  final String message;
  const SearchError(this.message);
}
