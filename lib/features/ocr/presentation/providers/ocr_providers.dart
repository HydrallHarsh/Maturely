import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/ml_kit_ocr_repository.dart';
import '../../domain/entities/ocr_result.dart';
import '../../domain/repositories/ocr_repository.dart';

final ocrRepositoryProvider = Provider<OcrRepository>((ref) {
  return MlKitOcrRepository();
});

final ocrResultProvider = StateProvider<OcrResult?>((ref) => null);
final extractedDataProvider =
    StateProvider<ExtractedDepositData?>((ref) => null);
