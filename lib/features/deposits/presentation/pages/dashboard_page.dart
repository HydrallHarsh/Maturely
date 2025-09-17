import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/deposit.dart';
import '../providers/deposit_providers.dart';
import '../providers/lineage_providers.dart';
import 'deposit_form_page.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const _DepositsList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const DepositFormPage(),
            ),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Deposit'),
      ),
    );
  }
}

class _DepositsList extends ConsumerStatefulWidget {
  const _DepositsList();

  @override
  ConsumerState<_DepositsList> createState() => _DepositsListState();
}

class _DepositsListState extends ConsumerState<_DepositsList> {
  bool _showUpcomingOnly = false;

  @override
  Widget build(BuildContext context) {
    final asyncDeposits = ref.watch(depositsListProvider);
    return asyncDeposits.when(
      data: (items) {
        if (items.isEmpty) {
          return const Center(
            child: Text('No deposits yet. Tap + to add one.'),
          );
        }

        // Filter deposits based on upcoming maturities
        final filteredItems = _showUpcomingOnly
            ? items
                .where(
                    (d) => d.isDueSoon(3) && d.status == DepositStatus.active)
                .toList()
            : items;

        // Calculate statistics - treat matured deposits as matured regardless of status
        final activeDeposits = items
            .where((d) => d.status == DepositStatus.active && !d.isMatured)
            .toList();
        final upcomingCount =
            activeDeposits.where((d) => d.isDueSoon(3)).length;
        final maturedCount = items.where((d) => d.isMatured).length;
        final activeCount = activeDeposits.length;

        return Column(
          children: [
            // Summary Cards
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: _SummaryCard(
                      title: 'Active',
                      count: activeCount,
                      color: Colors.green,
                      icon: Icons.account_balance,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SummaryCard(
                      title: 'Due Soon',
                      count: upcomingCount,
                      color: Colors.orange,
                      icon: Icons.schedule,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _SummaryCard(
                      title: 'Matured',
                      count: maturedCount,
                      color: Colors.blue,
                      icon: Icons.check_circle,
                    ),
                  ),
                ],
              ),
            ),
            // Filter Toggle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _showUpcomingOnly
                          ? 'Showing deposits due in next 3 days (${filteredItems.length})'
                          : 'All deposits (${items.length})',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Switch(
                    value: _showUpcomingOnly,
                    onChanged: (value) {
                      setState(() {
                        _showUpcomingOnly = value;
                      });
                    },
                  ),
                  const Text('Upcoming Only'),
                ],
              ),
            ),
            // Deposits List
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.invalidate(depositsListProvider);
                  ref.invalidate(chainsWithDepositsProvider);
                  ref.invalidate(orphanedDepositsProvider);
                  await ref.read(depositsListProvider.future);
                },
                child: filteredItems.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.schedule,
                              size: 64,
                              color: Colors.grey[400],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              _showUpcomingOnly
                                  ? 'No deposits due in next 3 days'
                                  : 'No deposits found',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.all(12),
                        itemBuilder: (context, index) {
                          final d = filteredItems[index];
                          return Dismissible(
                            key: Key(d.id),
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
                            ),
                            confirmDismiss: (direction) async {
                              return await showDialog<bool>(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Delete Deposit'),
                                      content: Text(
                                          'Are you sure you want to delete deposit ${d.srNo}?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(true),
                                          child: const Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  ) ??
                                  false;
                            },
                            onDismissed: (direction) async {
                              try {
                                final repo =
                                    ref.read(depositRepositoryProvider);
                                final lineageRepo =
                                    ref.read(lineageRepositoryProvider);

                                // Remove links that involve this deposit
                                final links =
                                    await lineageRepo.getDepositLinks(d.id);
                                for (final link in links) {
                                  await lineageRepo.unlinkDeposits(
                                      link.parentDepositId,
                                      link.childDepositId);
                                }

                                // Remove from any chains holding it
                                final chains =
                                    await lineageRepo.getChainsWithDeposits();
                                for (final chain in chains) {
                                  if (chain.depositIds.contains(d.id)) {
                                    await lineageRepo.removeDepositFromChain(
                                        chain.id, d.id);
                                  }
                                }

                                await repo.deleteDeposit(d.id);
                                if (mounted) {
                                  ref.invalidate(depositsListProvider);
                                  ref.invalidate(chainsWithDepositsProvider);
                                  ref.invalidate(orphanedDepositsProvider);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Deposit ${d.srNo} deleted')),
                                  );
                                }
                              } catch (e) {
                                if (mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Failed to delete: $e')),
                                  );
                                }
                              }
                            },
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: d.isDueSoon(3)
                                      ? Border.all(
                                          color: Colors.orange, width: 2)
                                      : null,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: d.isMatured
                                        ? Colors.blue
                                        : (d.isDueSoon(3)
                                            ? Colors.orange
                                            : (d.status == DepositStatus.active
                                                ? Colors.green
                                                : Colors.grey)),
                                    child: Icon(
                                      d.isMatured
                                          ? Icons.check_circle
                                          : (d.isDueSoon(3)
                                              ? Icons.schedule
                                              : (d.status ==
                                                      DepositStatus.active
                                                  ? Icons.account_balance
                                                  : Icons.cancel)),
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  title: Row(
                                    children: [
                                      Text('${d.srNo} • ${d.bankName}'),
                                      if (d.isDueSoon(3)) ...[
                                        const SizedBox(width: 8),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Text(
                                            'DUE SOON',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                  subtitle: Text('${d.holdersDisplay}  •  Due: '
                                      '${d.dueDate.day.toString().padLeft(2, '0')}-'
                                      '${d.dueDate.month.toString().padLeft(2, '0')}-${d.dueDate.year}'),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          '₹${d.amountDeposited.toStringAsFixed(2)}'),
                                      Column(
                                        children: [
                                          Text(
                                            d.isMatured
                                                ? 'MATURED'
                                                : d.status.name.toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: d.isMatured
                                                  ? Colors.blue
                                                  : (d.status ==
                                                          DepositStatus.active
                                                      ? Colors.green
                                                      : Colors.grey),
                                            ),
                                          ),
                                          if (d.requiresAction) ...[
                                            const SizedBox(height: 2),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 2),
                                              decoration: BoxDecoration(
                                                color: Colors.orange[100],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                'ACTION REQUIRED',
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.orange[700],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    // Navigate to appropriate page based on status
                                    if (d.requiresAction) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Matured deposit: ${d.srNo}')),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Edit deposit: ${d.srNo}')),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemCount: filteredItems.length,
                      ),
              ),
            ),
          ],
        );
      },
      error: (e, st) => Center(child: Text('Error: $e')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final int count;
  final Color color;
  final IconData icon;

  const _SummaryCard({
    required this.title,
    required this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              count.toString(),
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
