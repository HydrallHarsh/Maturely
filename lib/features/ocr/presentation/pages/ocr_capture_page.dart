import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/ocr_providers.dart';
import 'ocr_review_page.dart';

class OcrCapturePage extends ConsumerStatefulWidget {
  const OcrCapturePage({super.key});

  @override
  ConsumerState<OcrCapturePage> createState() => _OcrCapturePageState();
}

class _OcrCapturePageState extends ConsumerState<OcrCapturePage> {
  bool _isProcessing = false;

  Future<void> _captureImage() async {
    setState(() => _isProcessing = true);

    try {
      final repo = ref.read(ocrRepositoryProvider);
      final imagePath = await repo.captureImage();

      if (imagePath != null && mounted) {
        await _processImage(imagePath);
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image captured')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error capturing image: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  Future<void> _pickImage() async {
    setState(() => _isProcessing = true);

    try {
      final repo = ref.read(ocrRepositoryProvider);
      final imagePath = await repo.pickImage();

      if (imagePath != null && mounted) {
        await _processImage(imagePath);
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No image selected')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isProcessing = false);
    }
  }

  Future<void> _processImage(String imagePath) async {
    try {
      final repo = ref.read(ocrRepositoryProvider);
      final ocrResult = await repo.processImage(imagePath);

      if (mounted) {
        ref.read(ocrResultProvider.notifier).state = ocrResult;

        if (ocrResult.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('OCR Error: ${ocrResult.error}')),
          );
        } else {
          // Extract deposit data
          final extractedData = await repo.extractDepositData(ocrResult);
          ref.read(extractedDataProvider.notifier).state = extractedData;

          // Navigate to review page
          if (mounted) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OcrReviewPage(imagePath: imagePath),
              ),
            );
          }
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error processing image: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OCR Capture'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Clear OCR state when going back
            ref.read(ocrResultProvider.notifier).state = null;
            ref.read(extractedDataProvider.notifier).state = null;
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt,
              size: 120,
              color:
                  _isProcessing ? Colors.grey : Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 32),
            Text(
              'Scan Deposit Document',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Capture or select an image of your deposit receipt or diary page to automatically extract deposit information.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            if (_isProcessing) ...[
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              const Text('Processing image...'),
            ] else ...[
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: _captureImage,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Take Photo'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _pickImage,
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Choose from Gallery'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 32),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tips for better results:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    const Text('• Ensure good lighting'),
                    const Text('• Keep the document flat'),
                    const Text('• Avoid shadows and glare'),
                    const Text('• Make sure text is clearly visible'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
