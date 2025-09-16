import '../entities/ocr_result.dart';

abstract class OcrRepository {
  /// Capture image from camera
  Future<String?> captureImage();

  /// Pick image from gallery
  Future<String?> pickImage();

  /// Process image with OCR
  Future<OcrResult> processImage(String imagePath);

  /// Extract deposit data from OCR result
  Future<ExtractedDepositData> extractDepositData(OcrResult ocrResult);
}
