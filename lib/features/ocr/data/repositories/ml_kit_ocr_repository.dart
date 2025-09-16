import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../../domain/entities/ocr_result.dart';
import '../../domain/repositories/ocr_repository.dart';

class MlKitOcrRepository implements OcrRepository {
  final ImagePicker _imagePicker = ImagePicker();
  final TextRecognizer _textRecognizer = TextRecognizer();

  @override
  Future<String?> captureImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1080,
      );

      if (image == null) return null;

      // Move to app directory
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = 'ocr_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final newPath = path.join(appDir.path, fileName);

      await File(image.path).copy(newPath);
      return newPath;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1920,
        maxHeight: 1080,
      );

      if (image == null) return null;

      // Move to app directory
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = 'ocr_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final newPath = path.join(appDir.path, fileName);

      await File(image.path).copy(newPath);
      return newPath;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<OcrResult> processImage(String imagePath) async {
    try {
      final inputImage = InputImage.fromFilePath(imagePath);
      final recognizedText = await _textRecognizer.processImage(inputImage);

      final rawText = recognizedText.text;
      final extractedFields = _extractFields(rawText);

      return OcrResult(
        imagePath: imagePath,
        rawText: rawText,
        extractedFields: extractedFields,
        processedAt: DateTime.now(),
      );
    } catch (e) {
      return OcrResult(
        imagePath: imagePath,
        rawText: '',
        extractedFields: {},
        processedAt: DateTime.now(),
        error: e.toString(),
      );
    }
  }

  @override
  Future<ExtractedDepositData> extractDepositData(OcrResult ocrResult) async {
    if (ocrResult.error != null) {
      return ExtractedDepositData(
        confidence: 0.0,
      );
    }

    final fields = ocrResult.extractedFields;
    double confidence = 0.0;

    // Extract and validate each field
    final srNo = fields['srNo'];
    if (srNo != null && srNo.isNotEmpty) {
      confidence += 0.2;
    }

    final holderName = fields['holderName'];
    if (holderName != null && holderName.isNotEmpty) {
      confidence += 0.2;
    }

    final bankName = fields['bankName'];
    if (bankName != null && bankName.isNotEmpty) {
      confidence += 0.2;
    }

    final accountNumber = fields['accountNumber'];
    if (accountNumber != null && accountNumber.isNotEmpty) {
      confidence += 0.1;
    }

    final fdrNo = fields['fdrNo'];
    if (fdrNo != null && fdrNo.isNotEmpty) {
      confidence += 0.1;
    }

    final amountDeposited = _parseAmount(fields['amountDeposited']);
    if (amountDeposited != null) {
      confidence += 0.1;
    }

    final dueAmount = _parseAmount(fields['dueAmount']);
    if (dueAmount != null) {
      confidence += 0.1;
    }

    final dateDeposited = _parseDate(fields['dateDeposited']);
    if (dateDeposited != null) {
      confidence += 0.1;
    }

    final dueDate = _parseDate(fields['dueDate']);
    if (dueDate != null) {
      confidence += 0.1;
    }

    return ExtractedDepositData(
      srNo: srNo,
      holderName: holderName,
      bankName: bankName,
      accountNumber: accountNumber,
      fdrNo: fdrNo,
      amountDeposited: amountDeposited,
      dueAmount: dueAmount,
      dateDeposited: dateDeposited,
      dueDate: dueDate,
      confidence: confidence,
    );
  }

  Map<String, String> _extractFields(String text) {
    final fields = <String, String>{};

    // Extract Sr No
    final srNoMatch = RegExp(r'(?:Sr\.?\s*No\.?|Serial\s*No\.?)[\s:]*(\d+)',
            caseSensitive: false)
        .firstMatch(text);
    if (srNoMatch != null) {
      fields['srNo'] = srNoMatch.group(1) ?? '';
    }

    // Extract Holder Name (look for common patterns)
    final namePatterns = [
      r'(?:Name|Holder|Account\s*Holder)[\s:]*([A-Za-z\s]+?)(?:\n|$|Bank|Amount)',
      r'^([A-Za-z\s]+?)(?:\n|Bank|Amount)',
    ];

    for (final pattern in namePatterns) {
      final nameMatch = RegExp(pattern, caseSensitive: false, multiLine: true)
          .firstMatch(text);
      if (nameMatch != null) {
        final name = nameMatch.group(1)?.trim();
        if (name != null && name.length > 2 && name.length < 50) {
          fields['holderName'] = name;
          break;
        }
      }
    }

    // Extract Bank Name
    final bankPatterns = [
      r'(?:Bank|Bank\s*Name)[\s:]*([A-Za-z\s&]+?)(?:\n|$|Account|Amount)',
      r'(SBI|HDFC|ICICI|Axis|Kotak|PNB|BOI|Canara|Union|Indian|Bank|Bank\s*of\s*India)',
    ];

    for (final pattern in bankPatterns) {
      final bankMatch = RegExp(pattern, caseSensitive: false).firstMatch(text);
      if (bankMatch != null) {
        fields['bankName'] = bankMatch.group(1)?.trim() ?? '';
        break;
      }
    }

    // Extract Account Number
    final accountMatch =
        RegExp(r'(?:A/c|Account|A/C\s*No\.?)[\s:]*(\d+)', caseSensitive: false)
            .firstMatch(text);
    if (accountMatch != null) {
      fields['accountNumber'] = accountMatch.group(1) ?? '';
    }

    // Extract FDR Number
    final fdrMatch = RegExp(r'(?:FDR|F\.D\.R)[\s:]*(\d+)', caseSensitive: false)
        .firstMatch(text);
    if (fdrMatch != null) {
      fields['fdrNo'] = fdrMatch.group(1) ?? '';
    }

    // Extract Amounts
    final amountPattern =
        RegExp(r'₹?\s*(\d{1,3}(?:,\d{3})*(?:\.\d+)?)', caseSensitive: false);
    final amounts =
        amountPattern.allMatches(text).map((m) => m.group(1)).toList();

    if (amounts.isNotEmpty) {
      fields['amountDeposited'] = amounts.first ?? '';
      if (amounts.length > 1) {
        fields['dueAmount'] = amounts[1] ?? '';
      }
    }

    // Extract Dates (dd-MM-yyyy format)
    final datePattern =
        RegExp(r'(\d{1,2}[-/]\d{1,2}[-/]\d{2,4})', caseSensitive: false);
    final dates = datePattern.allMatches(text).map((m) => m.group(1)).toList();

    if (dates.isNotEmpty) {
      fields['dateDeposited'] = dates.first ?? '';
      if (dates.length > 1) {
        fields['dueDate'] = dates[1] ?? '';
      }
    }

    return fields;
  }

  double? _parseAmount(String? amountStr) {
    if (amountStr == null || amountStr.isEmpty) return null;

    try {
      // Remove currency symbols and commas
      final cleanAmount = amountStr.replaceAll(RegExp(r'[₹,\s]'), '');
      return double.parse(cleanAmount);
    } catch (e) {
      return null;
    }
  }

  DateTime? _parseDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return null;

    try {
      // Try dd-MM-yyyy format first
      final parts = dateStr.split(RegExp(r'[-/]'));
      if (parts.length == 3) {
        final day = int.parse(parts[0]);
        final month = int.parse(parts[1]);
        final year = int.parse(parts[2]);

        // Handle 2-digit years
        final fullYear =
            year < 100 ? (year < 50 ? 2000 + year : 1900 + year) : year;

        return DateTime(fullYear, month, day);
      }
    } catch (e) {
      // Try other formats if needed
    }

    return null;
  }

  void dispose() {
    _textRecognizer.close();
  }
}
