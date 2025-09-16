import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/search_filters.dart';
import '../../domain/entities/search_result.dart';
import '../providers/search_providers.dart';
import '../../../deposits/domain/entities/deposit.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _showFilters = false;

  @override
  void initState() {
    super.initState();
    // Trigger initial search on page load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(searchControllerProvider.notifier).search();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchControllerProvider);
    final filters = ref.watch(searchFiltersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Deposits'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildSearchBar(filters),
          ),
        ),
      ),
      body: Column(
        children: [
          // Filter chips and toggle
          _buildFilterSection(filters),

          // Expandable filter panel
          if (_showFilters) _buildAdvancedFilters(filters),

          // Search results
          Expanded(
            child: _buildSearchResults(searchState),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(SearchFilters filters) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            focusNode: _searchFocusNode,
            decoration: InputDecoration(
              hintText: 'Search by holder, bank, FDR number...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _performSearch();
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.surface,
            ),
            onChanged: (value) {
              setState(() {});
              _performSearch();
            },
            onSubmitted: (value) => _performSearch(),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: Icon(
            _showFilters ? Icons.filter_list : Icons.filter_list_outlined,
            color: _showFilters ? Theme.of(context).colorScheme.primary : null,
          ),
          onPressed: () {
            setState(() {
              _showFilters = !_showFilters;
            });
          },
        ),
      ],
    );
  }

  Widget _buildFilterSection(SearchFilters filters) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Filters',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              if (filters.hasActiveFilters) ...[
                const SizedBox(width: 8),
                Chip(
                  label: Text('${filters.activeFilterCount}'),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                const SizedBox(width: 8),
                TextButton(
                  onPressed: () {
                    ref.read(searchControllerProvider.notifier).clearFilters();
                    _searchController.clear();
                  },
                  child: const Text('Clear All'),
                ),
              ],
              const Spacer(),
              _buildSortDropdown(filters),
            ],
          ),
          const SizedBox(height: 8),
          _buildFilterChips(filters),
        ],
      ),
    );
  }

  Widget _buildFilterChips(SearchFilters filters) {
    final List<Widget> chips = [];

    // Status filter chips
    for (final status in filters.statusFilters) {
      chips.add(FilterChip(
        label: Text(status.name.toUpperCase()),
        selected: true,
        onSelected: (selected) {
          final newFilters = filters.copyWith(
            statusFilters:
                filters.statusFilters.where((s) => s != status).toList(),
          );
          _updateFilters(newFilters);
        },
      ));
    }

    // Bank filter chips
    for (final bank in filters.bankFilters) {
      chips.add(FilterChip(
        label: Text(bank),
        selected: true,
        onSelected: (selected) {
          final newFilters = filters.copyWith(
            bankFilters: filters.bankFilters.where((b) => b != bank).toList(),
          );
          _updateFilters(newFilters);
        },
      ));
    }

    // Date range chip
    if (filters.fromDate != null || filters.toDate != null) {
      chips.add(FilterChip(
        label: const Text('Date Range'),
        selected: true,
        onSelected: (selected) {
          final newFilters = filters.clearDateFilters();
          _updateFilters(newFilters);
        },
      ));
    }

    // Amount range chip
    if (filters.minAmount != null || filters.maxAmount != null) {
      chips.add(FilterChip(
        label: const Text('Amount Range'),
        selected: true,
        onSelected: (selected) {
          final newFilters = filters.clearAmountFilters();
          _updateFilters(newFilters);
        },
      ));
    }

    if (chips.isEmpty) {
      return const Text('No active filters');
    }

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: chips,
    );
  }

  Widget _buildSortDropdown(SearchFilters filters) {
    return DropdownButton<SearchSortBy>(
      value: filters.sortBy,
      underline: const SizedBox(),
      items: SearchSortBy.values.map((sortBy) {
        return DropdownMenuItem(
          value: sortBy,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(sortBy.shortName),
              Icon(
                filters.sortOrder == SortOrder.ascending
                    ? Icons.arrow_upward
                    : Icons.arrow_downward,
                size: 16,
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (newSortBy) {
        if (newSortBy != null) {
          final newOrder = newSortBy == filters.sortBy
              ? (filters.sortOrder == SortOrder.ascending
                  ? SortOrder.descending
                  : SortOrder.ascending)
              : filters.sortOrder;

          final newFilters = filters.copyWith(
            sortBy: newSortBy,
            sortOrder: newOrder,
          );
          _updateFilters(newFilters);
        }
      },
    );
  }

  Widget _buildAdvancedFilters(SearchFilters filters) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Advanced Filters',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),

          // Status filters
          _buildStatusFilters(filters),
          const SizedBox(height: 16),

          // Date range filters
          _buildDateRangeFilters(filters),
          const SizedBox(height: 16),

          // Amount range filters
          _buildAmountRangeFilters(filters),
        ],
      ),
    );
  }

  Widget _buildStatusFilters(SearchFilters filters) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: DepositStatus.values.map((status) {
            final isSelected = filters.statusFilters.contains(status);
            return FilterChip(
              label: Text(status.name.toUpperCase()),
              selected: isSelected,
              onSelected: (selected) {
                final List<DepositStatus> newStatusFilters;
                if (selected) {
                  newStatusFilters = [...filters.statusFilters, status];
                } else {
                  newStatusFilters =
                      filters.statusFilters.where((s) => s != status).toList();
                }
                final newFilters =
                    filters.copyWith(statusFilters: newStatusFilters);
                _updateFilters(newFilters);
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDateRangeFilters(SearchFilters filters) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date Ranges',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.date_range),
                label: Text(
                  filters.fromDate != null && filters.toDate != null
                      ? 'Deposit: ${_formatDateRange(filters.fromDate!, filters.toDate!)}'
                      : 'Deposit Date Range',
                ),
                onPressed: () => _selectDepositDateRange(filters),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.event),
                label: Text(
                  filters.maturityFromDate != null &&
                          filters.maturityToDate != null
                      ? 'Maturity: ${_formatDateRange(filters.maturityFromDate!, filters.maturityToDate!)}'
                      : 'Maturity Date Range',
                ),
                onPressed: () => _selectMaturityDateRange(filters),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAmountRangeFilters(SearchFilters filters) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Amount Ranges',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: filters.minAmount?.toString() ?? '',
                decoration: const InputDecoration(
                  labelText: 'Min Amount',
                  prefixText: '₹',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  final amount = double.tryParse(value);
                  final newFilters = filters.copyWith(minAmount: amount);
                  _updateFilters(newFilters);
                },
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                initialValue: filters.maxAmount?.toString() ?? '',
                decoration: const InputDecoration(
                  labelText: 'Max Amount',
                  prefixText: '₹',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  final amount = double.tryParse(value);
                  final newFilters = filters.copyWith(maxAmount: amount);
                  _updateFilters(newFilters);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchResults(SearchState searchState) {
    return switch (searchState) {
      SearchInitial() => const Center(
          child: Text('Enter search criteria to find deposits'),
        ),
      SearchLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
      SearchError(message: final message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 64,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Search Error',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(message),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(searchControllerProvider.notifier).search();
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      SearchLoaded(result: final result) => _buildResultsList(result),
    };
  }

  Widget _buildResultsList(SearchResult result) {
    if (result.deposits.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No deposits found',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              result.isFiltered
                  ? 'Try adjusting your search filters'
                  : 'No deposits match your search',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (result.isFiltered) ...[
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  ref.read(searchControllerProvider.notifier).clearFilters();
                  _searchController.clear();
                },
                child: const Text('Clear All Filters'),
              ),
            ],
          ],
        ),
      );
    }

    return Column(
      children: [
        // Results summary
        Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
          child: Row(
            children: [
              Text(
                result.summaryText,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              Text(
                'in ${result.searchDuration.inMilliseconds}ms',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),

        // Results list
        Expanded(
          child: ListView.builder(
            itemCount: result.deposits.length,
            itemBuilder: (context, index) {
              final deposit = result.deposits[index];
              return _buildDepositCard(deposit);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDepositCard(Deposit deposit) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        title: Text('${deposit.srNo} • ${deposit.bankName}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${deposit.holdersDisplay} • ₹${deposit.dueAmount.toStringAsFixed(0)}'),
            Text(
              'Due: ${deposit.dueDate.day.toString().padLeft(2, '0')}-'
              '${deposit.dueDate.month.toString().padLeft(2, '0')}-${deposit.dueDate.year}',
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getStatusColor(deposit.status),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                deposit.status.name.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          // Navigate to deposit details
          context.push('/deposit/${deposit.id}');
        },
      ),
    );
  }

  Color _getStatusColor(DepositStatus status) {
    switch (status) {
      case DepositStatus.active:
        return Colors.green;
      case DepositStatus.matured:
        return Colors.orange;
      case DepositStatus.closed:
        return Colors.grey;
      case DepositStatus.inProcess:
        return Colors.blue;
    }
  }

  String _formatDateRange(DateTime from, DateTime to) {
    return '${from.day}/${from.month}/${from.year} - ${to.day}/${to.month}/${to.year}';
  }

  Future<void> _selectDepositDateRange(SearchFilters filters) async {
    final dateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      initialDateRange: filters.fromDate != null && filters.toDate != null
          ? DateTimeRange(start: filters.fromDate!, end: filters.toDate!)
          : null,
    );

    if (dateRange != null) {
      final newFilters = filters.copyWith(
        fromDate: dateRange.start,
        toDate: dateRange.end,
      );
      _updateFilters(newFilters);
    }
  }

  Future<void> _selectMaturityDateRange(SearchFilters filters) async {
    final dateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDateRange:
          filters.maturityFromDate != null && filters.maturityToDate != null
              ? DateTimeRange(
                  start: filters.maturityFromDate!,
                  end: filters.maturityToDate!)
              : null,
    );

    if (dateRange != null) {
      final newFilters = filters.copyWith(
        maturityFromDate: dateRange.start,
        maturityToDate: dateRange.end,
      );
      _updateFilters(newFilters);
    }
  }

  void _performSearch() {
    final query = _searchController.text.trim();
    final currentFilters = ref.read(searchFiltersProvider);
    final newFilters = currentFilters.copyWith(query: query);
    _updateFilters(newFilters);
  }

  void _updateFilters(SearchFilters filters) {
    ref.read(searchControllerProvider.notifier).updateFilters(filters);
  }
}
