import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/deposit_chain.dart';
import '../../domain/entities/deposit.dart';
import '../providers/lineage_providers.dart';

class ChainDetailsPage extends ConsumerStatefulWidget {
  final String chainId;

  const ChainDetailsPage({
    super.key,
    required this.chainId,
  });

  @override
  ConsumerState<ChainDetailsPage> createState() => _ChainDetailsPageState();
}

class _ChainDetailsPageState extends ConsumerState<ChainDetailsPage> {
  DepositChain? _chain;
  List<Deposit> _deposits = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadChainData();
  }

  Future<void> _loadChainData() async {
    try {
      final lineageRepo = ref.read(lineageRepositoryProvider);

      final chain = await lineageRepo.getChain(widget.chainId);
      List<Deposit> deposits = [];
      if (chain != null && chain.depositIds.isNotEmpty) {
        // Use the first deposit in the chain to collect the lineage
        deposits = await lineageRepo.getDepositLineage(chain.depositIds.first);
      }

      if (mounted) {
        setState(() {
          _chain = chain;
          _deposits = deposits;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $_error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    if (_chain == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Not Found')),
        body: const Center(
          child: Text('Chain not found'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_chain!.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _showEditChainDialog(),
            tooltip: 'Edit Chain',
          ),
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Delete Chain'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'delete') {
                _showDeleteChainDialog();
              }
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _loadChainData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Chain Info Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Theme.of(context).primaryColor,
                            child: Text(
                              _chain!.name.substring(0, 1).toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _chain!.name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                if (_chain!.description != null)
                                  Text(
                                    _chain!.description!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Colors.grey[600],
                                        ),
                                  ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getStatusColor(_chain!.status)
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              _chain!.status.name.toUpperCase(),
                              style: TextStyle(
                                color: _getStatusColor(_chain!.status),
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildStatCard(
                              'Total Deposits',
                              _chain!.totalDeposits.toString(),
                              Icons.account_balance,
                              Colors.blue,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildStatCard(
                              'Current Value',
                              '₹${_chain!.currentValue.toStringAsFixed(0)}',
                              Icons.attach_money,
                              Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Deposits Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Deposits in Chain (${_deposits.length})',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () => _showAddDepositDialog(),
                        icon: const Icon(Icons.add),
                        label: const Text('Add Deposit'),
                      ),
                      const SizedBox(width: 8),
                      if (_deposits.isNotEmpty)
                        TextButton.icon(
                          onPressed: _reinvestLatest,
                          icon: const Icon(Icons.trending_up),
                          label: const Text('Reinvest latest'),
                        ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              if (_deposits.isEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No Deposits in Chain',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Add deposits to this chain to track their lineage',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _deposits.length,
                  itemBuilder: (context, index) {
                    final deposit = _deposits[index];
                    return _DepositCard(
                      deposit: deposit,
                      onTap: () => _navigateToDeposit(deposit),
                      onRemove: () => _showRemoveDepositDialog(deposit),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      color: color.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
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

  Color _getStatusColor(ChainStatus status) {
    switch (status) {
      case ChainStatus.active:
        return Colors.green;
      case ChainStatus.closed:
        return Colors.red;
      case ChainStatus.archived:
        return Colors.grey;
    }
  }

  void _reinvestLatest() {
    if (_deposits.isEmpty) return;
    final latest = _deposits.last;
    // Navigate to new deposit form with previousDepositId to trigger lineage linking
    final uri = Uri(
      path: '/deposit/new',
      queryParameters: {
        'previousDepositId': latest.id,
        'holderName': latest.holdersDisplay,
        'bankName': latest.bankName,
        'accountNumber': latest.accountNumber,
        'amountDeposited': latest.dueAmount.toString(),
        'dateDeposited': DateTime.now().millisecondsSinceEpoch.toString(),
        'dueDate': DateTime.now()
            .add(const Duration(days: 365))
            .millisecondsSinceEpoch
            .toString(),
      },
    );
    context.push(uri.toString());
  }

  void _showEditChainDialog() {
    final nameController = TextEditingController(text: _chain!.name);
    final descriptionController =
        TextEditingController(text: _chain!.description ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Chain'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Chain Name',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (Optional)',
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.trim().isNotEmpty) {
                // TODO: Implement chain update
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Chain update coming soon!')),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showDeleteChainDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Chain'),
        content: Text(
          'Are you sure you want to delete the chain "${_chain!.name}"? This will not delete the deposits, but will remove the chain structure.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement chain deletion
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Chain deletion coming soon!')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showAddDepositDialog() {
    // TODO: Implement add deposit to chain dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Add deposit to chain feature coming soon!')),
    );
  }

  void _navigateToDeposit(Deposit deposit) {
    if (deposit.isMatured) {
      context.push('/deposit/matured/${deposit.id}');
    } else {
      context.push('/deposit/edit/${deposit.id}');
    }
  }

  void _showRemoveDepositDialog(Deposit deposit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove from Chain'),
        content: Text(
          'Are you sure you want to remove deposit ${deposit.srNo} from this chain?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // TODO: Implement remove deposit from chain
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Remove from chain coming soon!')),
              );
            },
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }
}

class _DepositCard extends StatelessWidget {
  final Deposit deposit;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const _DepositCard({
    required this.deposit,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: deposit.isMatured
              ? Colors.blue
              : (deposit.isDueSoon(3) ? Colors.orange : Colors.green),
          child: Icon(
            deposit.isMatured
                ? Icons.check_circle
                : (deposit.isDueSoon(3)
                    ? Icons.schedule
                    : Icons.account_balance),
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text('${deposit.srNo} • ${deposit.bankName}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${deposit.holdersDisplay} • ₹${deposit.dueAmount.toStringAsFixed(0)}'),
            Text(
              'Due: ${deposit.dueDate.day.toString().padLeft(2, '0')}-'
              '${deposit.dueDate.month.toString().padLeft(2, '0')}-${deposit.dueDate.year}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (deposit.isMatured)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(8),
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
            const SizedBox(width: 8),
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'remove',
                  child: Row(
                    children: [
                      Icon(Icons.remove_circle, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Remove from Chain'),
                    ],
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 'remove') {
                  onRemove();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
