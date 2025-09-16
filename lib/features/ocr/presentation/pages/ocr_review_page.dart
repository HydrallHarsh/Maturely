import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/ocr_providers.dart';

class OcrReviewPage extends ConsumerStatefulWidget {
  final String imagePath;

  const OcrReviewPage({super.key, required this.imagePath});

  @override
  ConsumerState<OcrReviewPage> createState() => _OcrReviewPageState();
}

class _OcrReviewPageState extends ConsumerState<OcrReviewPage> {
  final _formKey = GlobalKey<FormState>();
  final _srNoCtrl = TextEditingController();
  final _holderCtrl = TextEditingController();
  final _bankCtrl = TextEditingController();
  final _accountCtrl = TextEditingController();
  final _fdrCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  final _dueAmountCtrl = TextEditingController();
  DateTime? _dateDeposited;
  DateTime? _dueDate;

  @override
  void initState() {
    super.initState();
    _loadExtractedData();
  }

  void _loadExtractedData() {
    final extractedData = ref.read(extractedDataProvider);
    if (extractedData != null) {
      _srNoCtrl.text = extractedData.srNo ?? '';
      _holderCtrl.text = extractedData.holderName ?? '';
      _bankCtrl.text = extractedData.bankName ?? '';
      _accountCtrl.text = extractedData.accountNumber ?? '';
      _fdrCtrl.text = extractedData.fdrNo ?? '';
      _amountCtrl.text = extractedData.amountDeposited?.toString() ?? '';
      _dueAmountCtrl.text = extractedData.dueAmount?.toString() ?? '';
      _dateDeposited = extractedData.dateDeposited;
      _dueDate = extractedData.dueDate;
    }
  }

  @override
  void dispose() {
    _srNoCtrl.dispose();
    _holderCtrl.dispose();
    _bankCtrl.dispose();
    _accountCtrl.dispose();
    _fdrCtrl.dispose();
    _amountCtrl.dispose();
    _dueAmountCtrl.dispose();
    super.dispose();
  }

  Future<void> _createDeposit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_dateDeposited == null || _dueDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both dates')),
      );
      return;
    }

    // Navigate to deposit form with pre-filled data
    final queryParams = {
      'srNo': _srNoCtrl.text,
      'holderName': _holderCtrl.text,
      'bankName': _bankCtrl.text,
      'accountNumber': _accountCtrl.text,
      'fdrNo': _fdrCtrl.text,
      'amountDeposited': _amountCtrl.text,
      'dueAmount': _dueAmountCtrl.text,
      'dateDeposited': _dateDeposited!.millisecondsSinceEpoch.toString(),
      'dueDate': _dueDate!.millisecondsSinceEpoch.toString(),
    };

    final uri = Uri(path: '/deposit/new', queryParameters: queryParams);
    if (mounted) {
      context.push(uri.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final extractedData = ref.watch(extractedDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('OCR Review'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Clear OCR state and go back
            ref.read(ocrResultProvider.notifier).state = null;
            ref.read(extractedDataProvider.notifier).state = null;
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Clear state and go back to main navigation
              ref.read(ocrResultProvider.notifier).state = null;
              ref.read(extractedDataProvider.notifier).state = null;
              context.go('/');
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: _createDeposit,
            child: const Text('Create Deposit'),
          ),
        ],
      ),
      body: Column(
        children: [
          // Image Preview
          if (File(widget.imagePath).existsSync())
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Image.file(
                File(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),

          // Confidence Score
          if (extractedData != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: extractedData.confidence > 0.7
                  ? Colors.green[50]
                  : extractedData.confidence > 0.4
                      ? Colors.orange[50]
                      : Colors.red[50],
              child: Row(
                children: [
                  Icon(
                    extractedData.confidence > 0.7
                        ? Icons.check_circle
                        : extractedData.confidence > 0.4
                            ? Icons.warning
                            : Icons.error,
                    color: extractedData.confidence > 0.7
                        ? Colors.green
                        : extractedData.confidence > 0.4
                            ? Colors.orange
                            : Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Confidence: ${(extractedData.confidence * 100).toInt()}%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: extractedData.confidence > 0.7
                          ? Colors.green[700]
                          : extractedData.confidence > 0.4
                              ? Colors.orange[700]
                              : Colors.red[700],
                    ),
                  ),
                ],
              ),
            ),

          // Form
          Expanded(
            child: Padding(
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
                    TextFormField(
                      controller: _holderCtrl,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _bankCtrl,
                      decoration:
                          const InputDecoration(labelText: 'Bank Name / PPF'),
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Required' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _accountCtrl,
                      decoration:
                          const InputDecoration(labelText: 'Account Number'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _fdrCtrl,
                      decoration: const InputDecoration(labelText: 'FDR No'),
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _amountCtrl,
                      decoration:
                          const InputDecoration(labelText: 'Amount Deposited'),
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
                      decoration:
                          const InputDecoration(labelText: 'Due Amount'),
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
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () {
                              // Clear state and go back to capture
                              ref.read(ocrResultProvider.notifier).state = null;
                              ref.read(extractedDataProvider.notifier).state =
                                  null;
                              context.go('/');
                            },
                            icon: const Icon(Icons.camera_alt),
                            label: const Text('Retake'),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _createDeposit,
                            icon: const Icon(Icons.save),
                            label: const Text('Create Deposit'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
