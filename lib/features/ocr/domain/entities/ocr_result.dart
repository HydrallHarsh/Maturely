class OcrResult {
  final String imagePath;
  final String rawText;
  final Map<String, String> extractedFields;
  final DateTime processedAt;
  final String? error;

  const OcrResult({
    required this.imagePath,
    required this.rawText,
    required this.extractedFields,
    required this.processedAt,
    this.error,
  });

  factory OcrResult.fromJson(Map<String, dynamic> json) {
    return OcrResult(
      imagePath: json['imagePath'] as String,
      rawText: json['rawText'] as String,
      extractedFields: Map<String, String>.from(json['extractedFields'] as Map),
      processedAt: DateTime.parse(json['processedAt'] as String),
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'rawText': rawText,
      'extractedFields': extractedFields,
      'processedAt': processedAt.toIso8601String(),
      'error': error,
    };
  }
}

class ExtractedDepositData {
  final String? srNo;
  final String? holderName;
  final String? bankName;
  final String? accountNumber;
  final String? fdrNo;
  final double? amountDeposited;
  final double? dueAmount;
  final DateTime? dateDeposited;
  final DateTime? dueDate;
  final String? notes;
  final double confidence;

  const ExtractedDepositData({
    this.srNo,
    this.holderName,
    this.bankName,
    this.accountNumber,
    this.fdrNo,
    this.amountDeposited,
    this.dueAmount,
    this.dateDeposited,
    this.dueDate,
    this.notes,
    required this.confidence,
  });

  factory ExtractedDepositData.fromJson(Map<String, dynamic> json) {
    return ExtractedDepositData(
      srNo: json['srNo'] as String?,
      holderName: json['holderName'] as String?,
      bankName: json['bankName'] as String?,
      accountNumber: json['accountNumber'] as String?,
      fdrNo: json['fdrNo'] as String?,
      amountDeposited: (json['amountDeposited'] as num?)?.toDouble(),
      dueAmount: (json['dueAmount'] as num?)?.toDouble(),
      dateDeposited: json['dateDeposited'] != null
          ? DateTime.parse(json['dateDeposited'] as String)
          : null,
      dueDate: json['dueDate'] != null
          ? DateTime.parse(json['dueDate'] as String)
          : null,
      notes: json['notes'] as String?,
      confidence: (json['confidence'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'srNo': srNo,
      'holderName': holderName,
      'bankName': bankName,
      'accountNumber': accountNumber,
      'fdrNo': fdrNo,
      'amountDeposited': amountDeposited,
      'dueAmount': dueAmount,
      'dateDeposited': dateDeposited?.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
      'notes': notes,
      'confidence': confidence,
    };
  }
}
