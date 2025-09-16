import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/deposit.dart';
import '../providers/deposit_providers.dart';
import '../providers/lineage_providers.dart';
import '../../../../core/utils/notification_service.dart';

class DepositFormPage extends ConsumerWidget {
  final String? depositId;

  const DepositFormPage({super.key, this.depositId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = depositId != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Deposit' : 'New Deposit'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          if (isEditing)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // TODO: Implement delete
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Delete feature coming soon!')),
                );
              },
            ),
        ],
      ),
      body: _DepositFormBody(depositId: depositId),
    );
  }
}

class _DepositFormBody extends ConsumerStatefulWidget {
  final String? depositId;
  const _DepositFormBody({required this.depositId});

  @override
  ConsumerState<_DepositFormBody> createState() => _DepositFormBodyState();
}

class _DepositFormBodyState extends ConsumerState<_DepositFormBody> {
  final _formKey = GlobalKey<FormState>();
  final _srNoCtrl = TextEditingController();
  final List<TextEditingController> _holderCtrls = [
    TextEditingController()
  ]; // Start with one holder
  final _bankCtrl = TextEditingController();
  final _accountCtrl = TextEditingController();
  final _fdrCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  final _dueAmountCtrl = TextEditingController();
  DateTime? _dateDeposited;
  DateTime? _dueDate;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.depositId != null) {
      _loadDeposit();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.depositId == null) {
      _loadFromQueryParams();
    }
  }

  void _loadFromQueryParams() {
    try {
      final uri = GoRouterState.of(context).uri;
      if (uri.queryParameters.isNotEmpty) {
        _srNoCtrl.text = uri.queryParameters['srNo'] ?? '';
        _holderCtrls[0].text = uri.queryParameters['holderName'] ?? '';
        _bankCtrl.text = uri.queryParameters['bankName'] ?? '';
        _accountCtrl.text = uri.queryParameters['accountNumber'] ?? '';
        _fdrCtrl.text = uri.queryParameters['fdrNo'] ?? '';
        _amountCtrl.text = uri.queryParameters['amountDeposited'] ?? '';
        _dueAmountCtrl.text = uri.queryParameters['dueAmount'] ?? '';

        final dateDepositedMs =
            int.tryParse(uri.queryParameters['dateDeposited'] ?? '');
        if (dateDepositedMs != null) {
          _dateDeposited = DateTime.fromMillisecondsSinceEpoch(dateDepositedMs);
        }

        final dueDateMs = int.tryParse(uri.queryParameters['dueDate'] ?? '');
        if (dueDateMs != null) {
          _dueDate = DateTime.fromMillisecondsSinceEpoch(dueDateMs);
        }
      }
    } catch (e) {
      // Handle case where GoRouterState is not available
      print('Error loading query params: $e');
    }
  }

  void _addHolder() {
    if (_holderCtrls.length < 2) {
      // Maximum 2 holders
      setState(() {
        _holderCtrls.add(TextEditingController());
      });
    }
  }

  void _removeHolder(int index) {
    if (_holderCtrls.length > 1 && index < _holderCtrls.length) {
      setState(() {
        _holderCtrls[index].dispose();
        _holderCtrls.removeAt(index);
      });
    }
  }

  @override
  void dispose() {
    _srNoCtrl.dispose();
    for (final ctrl in _holderCtrls) {
      ctrl.dispose();
    }
    _bankCtrl.dispose();
    _accountCtrl.dispose();
    _fdrCtrl.dispose();
    _amountCtrl.dispose();
    _dueAmountCtrl.dispose();
    super.dispose();
  }

  Future<void> _loadDeposit() async {
    if (widget.depositId == null) return;
    setState(() => _isLoading = true);
    try {
      final repo = ref.read(depositRepositoryProvider);
      final deposit = await repo.getDepositById(widget.depositId!);
      if (deposit != null && mounted) {
        _srNoCtrl.text = deposit.srNo;
        // Load holders into controllers
        _holderCtrls.clear();
        for (int i = 0; i < deposit.holders.length; i++) {
          if (i < _holderCtrls.length) {
            _holderCtrls[i].text = deposit.holders[i];
          } else {
            _holderCtrls.add(TextEditingController(text: deposit.holders[i]));
          }
        }
        // Ensure at least one holder controller exists
        if (_holderCtrls.isEmpty) {
          _holderCtrls.add(TextEditingController());
        }
        _bankCtrl.text = deposit.bankName;
        _accountCtrl.text = deposit.accountNumber;
        _fdrCtrl.text = deposit.fdrNo;
        _amountCtrl.text = deposit.amountDeposited.toString();
        _dueAmountCtrl.text = deposit.dueAmount.toString();
        _dateDeposited = deposit.dateDeposited;
        _dueDate = deposit.dueDate;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load deposit: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (_dateDeposited == null || _dueDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both dates')),
      );
      return;
    }
    if (_isLoading) return;

    setState(() => _isLoading = true);
    try {
      final repo = ref.read(depositRepositoryProvider);

      // Check if this is a reinvestment (has previousDepositId in query params)
      String? previousDepositId;
      try {
        final uri = GoRouterState.of(context).uri;
        previousDepositId = uri.queryParameters['previousDepositId'];
      } catch (e) {
        // Ignore if GoRouterState is not available
      }

      final deposit = Deposit(
        id: widget.depositId ?? '',
        srNo: _srNoCtrl.text.trim(),
        holders: _holderCtrls
            .map((ctrl) => ctrl.text.trim())
            .where((h) => h.isNotEmpty)
            .toList(),
        bankName: _bankCtrl.text.trim(),
        accountNumber: _accountCtrl.text.trim(),
        fdrNo: _fdrCtrl.text.trim(),
        amountDeposited: double.parse(_amountCtrl.text.trim()),
        dueAmount: double.parse(_dueAmountCtrl.text.trim()),
        dateDeposited: _dateDeposited!,
        dueDate: _dueDate!,
        status: DepositStatus.active,
        previousDepositId: previousDepositId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        notes: null,
        attachments: const [],
      );

      final issues = deposit.validate();
      if (issues.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(issues.join('\n'))),
        );
        return;
      }

      if (widget.depositId != null) {
        await repo.updateDeposit(deposit);
        // Reschedule notifications in case dates changed
        await NotificationService.scheduleForDeposit(deposit);
      } else {
        final saved = await repo.createDeposit(deposit);
        await NotificationService.scheduleForDeposit(saved);

        // If this is a reinvestment, create a chain and link deposits
        if (previousDepositId != null) {
          try {
            print('🔄 Creating chain for reinvestment...');
            print('Previous Deposit ID: $previousDepositId');
            print('New Deposit ID: ${saved.id}');

            final lineageRepo = ref.read(lineageRepositoryProvider);

            // Always create a new chain for reinvestments
            print('Creating new chain...');
            final chain = await lineageRepo.createChain(
              name: 'Chain from ${deposit.bankName}',
              description:
                  'Deposit chain starting from ${deposit.bankName} - ${deposit.srNo}',
            );
            print('✅ Chain created: ${chain.name} (${chain.id})');

            // Add the parent deposit to the chain
            await lineageRepo.addDepositToChain(chain.id, previousDepositId);
            print('✅ Parent deposit added to chain');

            // Add the new deposit to the chain
            await lineageRepo.addDepositToChain(chain.id, saved.id);
            print('✅ New deposit added to chain');

            // Create the link between deposits
            await lineageRepo.linkDeposits(
              parentDepositId: previousDepositId,
              childDepositId: saved.id,
              reinvestedAmount: saved.amountDeposited,
              notes: 'Reinvestment from matured deposit',
            );
            print('✅ Deposits linked successfully');
          } catch (e) {
            // Log error but don't fail the save
            print('❌ Error creating chain and linking deposits: $e');
            print('Stack trace: ${StackTrace.current}');
          }
        }
      }

      // Refresh list and lineage data
      ref.invalidate(depositsListProvider);
      ref.invalidate(chainsWithDepositsProvider);
      ref.invalidate(orphanedDepositsProvider);
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _srNoCtrl,
              decoration: const InputDecoration(labelText: 'Sr No'),
              keyboardType: TextInputType.number,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            // Multiple Holders Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Holders',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        if (_holderCtrls.length < 2)
                          IconButton(
                            onPressed: _addHolder,
                            icon: const Icon(Icons.add_circle),
                            tooltip: 'Add another holder',
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(
                      _holderCtrls.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _holderCtrls[index],
                                decoration: InputDecoration(
                                  labelText: index == 0
                                      ? 'Primary Holder'
                                      : 'Secondary Holder',
                                  hintText: 'Enter holder name',
                                ),
                                validator: (v) {
                                  if (index == 0 &&
                                      (v == null || v.trim().isEmpty)) {
                                    return 'Primary holder is required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            if (_holderCtrls.length > 1)
                              IconButton(
                                onPressed: () => _removeHolder(index),
                                icon: const Icon(Icons.remove_circle),
                                tooltip: 'Remove holder',
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _bankCtrl,
              decoration: const InputDecoration(labelText: 'Bank Name / PPF'),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _accountCtrl,
              decoration: const InputDecoration(labelText: 'Account Number'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _fdrCtrl,
              decoration: const InputDecoration(labelText: 'FDR No'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _amountCtrl,
              decoration: const InputDecoration(labelText: 'Amount Deposited'),
              keyboardType: TextInputType.number,
              validator: (v) {
                final d = double.tryParse((v ?? '').trim());
                if (d == null || d <= 0) return 'Enter a valid amount';
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _dueAmountCtrl,
              decoration: const InputDecoration(labelText: 'Due Amount'),
              keyboardType: TextInputType.number,
              validator: (v) {
                final d = double.tryParse((v ?? '').trim());
                if (d == null || d <= 0) return 'Enter a valid amount';
                return null;
              },
            ),
            const SizedBox(height: 12),
            _DatePickerTile(
              label: 'Date Deposited (dd-MM-yyyy)',
              date: _dateDeposited,
              onPick: (d) => setState(() => _dateDeposited = d),
            ),
            const SizedBox(height: 12),
            _DatePickerTile(
              label: 'Due Date (dd-MM-yyyy)',
              date: _dueDate,
              onPick: (d) => setState(() => _dueDate = d),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _save,
              icon: _isLoading
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save),
              label: Text(
                  widget.depositId != null ? 'Update Deposit' : 'Save Deposit'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DatePickerTile extends StatelessWidget {
  final String label;
  final DateTime? date;
  final ValueChanged<DateTime> onPick;
  const _DatePickerTile(
      {required this.label, required this.date, required this.onPick});

  @override
  Widget build(BuildContext context) {
    final text = date == null
        ? 'Select date'
        : '${date!.day.toString().padLeft(2, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.year}';
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(label),
      subtitle: Text(text),
      trailing: const Icon(Icons.date_range),
      onTap: () async {
        final now = DateTime.now();
        final picked = await showDatePicker(
          context: context,
          initialDate: date ?? now,
          firstDate: DateTime(now.year - 50),
          lastDate: DateTime(now.year + 50),
        );
        if (picked != null) onPick(picked);
      },
    );
  }
}
