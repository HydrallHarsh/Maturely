import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/deposit.dart';
import '../providers/deposit_providers.dart';
import '../providers/lineage_providers.dart';

class MaturedDepositPage extends ConsumerStatefulWidget {
  final String depositId;

  const MaturedDepositPage({
    super.key,
    required this.depositId,
  });

  @override
  ConsumerState<MaturedDepositPage> createState() => _MaturedDepositPageState();
}

class _MaturedDepositPageState extends ConsumerState<MaturedDepositPage> {
  Deposit? _deposit;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadDeposit();
  }

  Future<void> _loadDeposit() async {
    try {
      final repo = ref.read(depositRepositoryProvider);
      final deposit = await repo.getDepositById(widget.depositId);
      if (mounted) {
        setState(() {
          _deposit = deposit;
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

    if (_deposit == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Not Found')),
        body: const Center(
          child: Text('Deposit not found'),
        ),
      );
    }

    // Check if deposit has already been processed
    if (!_deposit!.requiresAction) {
      return Scaffold(
        appBar: AppBar(title: const Text('Processed Deposit')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _deposit!.closureType == ClosureType.reinvested
                    ? Icons.repeat
                    : _deposit!.closureType == ClosureType.withdrawn
                        ? Icons.account_balance_wallet
                        : Icons.check_circle,
                size: 64,
                color: _deposit!.closureType == ClosureType.reinvested
                    ? Colors.green
                    : _deposit!.closureType == ClosureType.withdrawn
                        ? Colors.orange
                        : Colors.grey,
              ),
              const SizedBox(height: 16),
              Text(
                _deposit!.closureType == ClosureType.reinvested
                    ? 'Reinvested'
                    : _deposit!.closureType == ClosureType.withdrawn
                        ? 'Withdrawn'
                        : 'Closed',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'This deposit has already been processed.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matured Deposit'),
        actions: [
          if (_deposit!.requiresAction)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => context.push('/deposit/edit/${_deposit!.id}'),
              tooltip: 'Edit Deposit',
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Deposit Info Card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: const Icon(Icons.check_circle,
                              color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${_deposit!.srNo} • ${_deposit!.bankName}',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                _deposit!.holdersDisplay,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
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
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'MATURED',
                            style: TextStyle(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildInfoRow('Account Number', _deposit!.accountNumber),
                    _buildInfoRow('FDR Number', _deposit!.fdrNo),
                    _buildInfoRow('Amount Deposited',
                        '₹${_deposit!.amountDeposited.toStringAsFixed(2)}'),
                    _buildInfoRow('Due Amount',
                        '₹${_deposit!.dueAmount.toStringAsFixed(2)}'),
                    _buildInfoRow('Interest Earned',
                        '₹${_deposit!.interestAmount.toStringAsFixed(2)}'),
                    _buildInfoRow('Interest Rate',
                        '${_deposit!.interestRate.toStringAsFixed(2)}%'),
                    _buildInfoRow(
                        'Date Deposited', _formatDate(_deposit!.dateDeposited)),
                    _buildInfoRow(
                        'Maturity Date', _formatDate(_deposit!.dueDate)),
                    _buildInfoRow('Maturity Period',
                        '${_deposit!.maturityPeriodDays} days'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Action Required Section
            Text(
              'Action Required',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'This deposit has matured. What would you like to do with the matured amount?',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 16),

            // Action Buttons
            _buildActionButton(
              icon: Icons.repeat,
              title: 'Reinvest',
              subtitle: 'Use this amount to create a new deposit',
              color: Colors.green,
              onTap: () => _showReinvestDialog(),
            ),
            const SizedBox(height: 12),
            _buildActionButton(
              icon: Icons.account_balance_wallet,
              title: 'Withdrawn',
              subtitle: 'Mark as withdrawn and close this deposit',
              color: Colors.orange,
              onTap: () => _showWithdrawDialog(),
            ),
            const SizedBox(height: 12),
            _buildActionButton(
              icon: Icons.more_horiz,
              title: 'Other',
              subtitle: 'Mark as closed for other reasons',
              color: Colors.grey,
              onTap: () => _showOtherDialog(),
            ),

            const SizedBox(height: 24),

            // Lineage Info
            if (_deposit!.isPartOfChain) ...[
              Card(
                color: Colors.blue[50],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.account_tree, color: Colors.blue[700]),
                          const SizedBox(width: 8),
                          Text(
                            'Part of Chain',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[700],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      if (_deposit!.previousDepositId != null)
                        Text('Previous: ${_deposit!.previousDepositId}'),
                      if (_deposit!.nextDepositId != null)
                        Text('Next: ${_deposit!.nextDepositId}'),
                      if (_deposit!.chainId != null)
                        Text('Chain ID: ${_deposit!.chainId}'),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.1),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, color: color),
        onTap: onTap,
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}-'
        '${date.month.toString().padLeft(2, '0')}-${date.year}';
  }

  void _showReinvestDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reinvest Matured Amount'),
        content: Text(
          'This will mark the current deposit as reinvested and create a new deposit with the matured amount (₹${_deposit!.dueAmount.toStringAsFixed(2)}).\n\n'
          'The new deposit will be automatically linked to this one in the lineage chain.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _handleReinvest();
            },
            child: const Text('Reinvest'),
          ),
        ],
      ),
    );
  }

  void _showWithdrawDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mark as Withdrawn'),
        content: Text(
          'This will mark the deposit as withdrawn and close it. The matured amount (₹${_deposit!.dueAmount.toStringAsFixed(2)}) will be considered withdrawn.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _handleWithdraw();
            },
            child: const Text('Mark Withdrawn'),
          ),
        ],
      ),
    );
  }

  void _showOtherDialog() {
    final notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mark as Closed'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
                'This will mark the deposit as closed. Please provide a reason:'),
            const SizedBox(height: 16),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(
                labelText: 'Reason for closure',
                hintText: 'e.g., Transferred to another bank, etc.',
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
              Navigator.of(context).pop();
              _handleOther(notesController.text.trim());
            },
            child: const Text('Mark Closed'),
          ),
        ],
      ),
    );
  }

  Future<void> _handleReinvest() async {
    try {
      // Mark current deposit as reinvested
      final updatedDeposit = _deposit!.close(ClosureType.reinvested);
      final repo = ref.read(depositRepositoryProvider);
      await repo.updateDeposit(updatedDeposit);

      // Refresh lineage data
      ref.invalidate(depositsListProvider);
      ref.invalidate(chainsWithDepositsProvider);
      ref.invalidate(orphanedDepositsProvider);

      // Navigate to create new deposit with pre-filled data
      final queryParams = {
        'previousDepositId': _deposit!.id,
        'amountDeposited': _deposit!.dueAmount.toString(),
        'holderName': _deposit!.holdersDisplay,
        'bankName': _deposit!.bankName,
        'accountNumber': _deposit!.accountNumber,
        'dateDeposited': DateTime.now().millisecondsSinceEpoch.toString(),
        'dueDate': DateTime.now()
            .add(const Duration(days: 365))
            .millisecondsSinceEpoch
            .toString(),
      };

      final uri = Uri(
        path: '/deposit/new',
        queryParameters: queryParams,
      );

      if (mounted) {
        context.push(uri.toString());
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _handleWithdraw() async {
    try {
      final updatedDeposit = _deposit!.close(ClosureType.withdrawn);
      final repo = ref.read(depositRepositoryProvider);
      await repo.updateDeposit(updatedDeposit);

      // Refresh lineage data
      ref.invalidate(depositsListProvider);
      ref.invalidate(chainsWithDepositsProvider);
      ref.invalidate(orphanedDepositsProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Deposit marked as withdrawn')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _handleOther(String notes) async {
    try {
      final updatedDeposit = _deposit!.close(ClosureType.unknown, notes: notes);
      final repo = ref.read(depositRepositoryProvider);
      await repo.updateDeposit(updatedDeposit);

      // Refresh lineage data
      ref.invalidate(depositsListProvider);
      ref.invalidate(chainsWithDepositsProvider);
      ref.invalidate(orphanedDepositsProvider);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Deposit marked as closed')),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }
}
