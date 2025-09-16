import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/hive_bootstrap.dart';
import '../../data/models/deposit_hive_model.dart';
import '../../data/models/deposit_chain_hive_model.dart';
import '../providers/deposit_providers.dart';
import '../providers/lineage_providers.dart';

class DbInspectorPage extends ConsumerStatefulWidget {
  const DbInspectorPage({super.key});

  @override
  ConsumerState<DbInspectorPage> createState() => _DbInspectorPageState();
}

class _DbInspectorPageState extends ConsumerState<DbInspectorPage> {
  Box<DepositHiveModel>? _box;
  List<DepositHiveModel> _items = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    try {
      _box = Hive.box<DepositHiveModel>(HiveBootstrap.depositsBoxName);
      _items = _box!.values.toList();
      setState(() {});
    } catch (e) {
      // ignore: avoid_print
      print('Error loading DB: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DB Inspector'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData,
          ),
        ],
      ),
      body: _box == null
          ? const Center(child: Text('DB not available'))
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Records: ${_items.length}'),
                      ElevatedButton(
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Clear ALL data?'),
                              content: const Text(
                                  'This will remove deposits and lineage (chains + links). This action cannot be undone.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  child: const Text('Delete All'),
                                ),
                              ],
                            ),
                          );
                          if (confirm != true) return;
                          // Clear deposits + lineage together to keep data consistent
                          final chainsBox = Hive.box<DepositChainHiveModel>(
                              HiveBootstrap.chainsBoxName);
                          final linksBox = Hive.box<ChainLinkHiveModel>(
                              HiveBootstrap.linksBoxName);

                          await Future.wait([
                            _box!.clear(),
                            chainsBox.clear(),
                            linksBox.clear(),
                          ]);

                          // Invalidate providers so UI refreshes everywhere
                          ref.invalidate(depositsListProvider);
                          ref.invalidate(chainsWithDepositsProvider);
                          ref.invalidate(orphanedDepositsProvider);

                          _loadData();
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'All data cleared (deposits + lineage)')),
                            );
                          }
                        },
                        child: const Text('Clear DB'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _items.isEmpty
                      ? const Center(child: Text('No records found'))
                      : ListView.builder(
                          itemCount: _items.length,
                          itemBuilder: (context, index) {
                            final item = _items[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4),
                              child: ExpansionTile(
                                title: Text(
                                    '${item.srNo} - ${item.holders.join(", ")}'),
                                subtitle: Text(
                                    '${item.bankName} • ₹${item.amountDeposited}'),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _InfoRow('ID', item.id),
                                        _InfoRow('Sr No', item.srNo),
                                        _InfoRow(
                                            'Holder', item.holders.join(", ")),
                                        _InfoRow('Bank', item.bankName),
                                        _InfoRow('Account', item.accountNumber),
                                        _InfoRow('FDR', item.fdrNo),
                                        _InfoRow('Amount',
                                            '₹${item.amountDeposited}'),
                                        _InfoRow(
                                            'Due Amount', '₹${item.dueAmount}'),
                                        _InfoRow('Date Deposited',
                                            _formatDate(item.dateDeposited)),
                                        _InfoRow('Due Date',
                                            _formatDate(item.dueDate)),
                                        _InfoRow('Status', item.status),
                                        if (item.closureType != null)
                                          _InfoRow(
                                              'Closure', item.closureType!),
                                        if (item.previousDepositId != null)
                                          _InfoRow('Previous',
                                              item.previousDepositId!),
                                        if (item.nextDepositId != null)
                                          _InfoRow('Next', item.nextDepositId!),
                                        if (item.chainId != null)
                                          _InfoRow('Chain', item.chainId!),
                                        _InfoRow('Created',
                                            _formatDate(item.createdAt)),
                                        _InfoRow('Updated',
                                            _formatDate(item.updatedAt)),
                                        if (item.notes != null)
                                          _InfoRow('Notes', item.notes!),
                                        _InfoRow('Attachments',
                                            '${item.attachments.length}'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontFamily: 'monospace'),
            ),
          ),
        ],
      ),
    );
  }
}
