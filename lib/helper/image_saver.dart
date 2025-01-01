import 'dart:html' as html; // For web
import 'dart:io';
import 'package:path_provider/path_provider.dart'; // Add this package
import 'package:file_picker/file_picker.dart'; // Add this package
import 'package:flutter/foundation.dart';

class ImageSaver {
  static Future<void> saveImage(
      {required Uint8List bytes, String? fileName}) async {
    fileName ??= 'erd_diagram_${DateTime.now().millisecondsSinceEpoch}.png';

    if (kIsWeb) {
      // Web implementation
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement()
        ..href = url
        ..download = fileName;

      // Trigger download
      anchor.click();

      // Clean up
      html.Url.revokeObjectUrl(url);
    } else {
      // Mobile and Desktop implementation
      try {
        String? outputPath;

        if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
          // Desktop: Let user choose save location
          outputPath = await FilePicker.platform.saveFile(
            dialogTitle: 'Save ERD diagram',
            fileName: fileName,
            allowedExtensions: ['png'],
            type: FileType.custom,
          );
        } else {
          // Mobile: Save to app documents directory
          final directory = await getApplicationDocumentsDirectory();
          outputPath = '${directory.path}/$fileName';
        }

        if (outputPath == null) return; // User cancelled

        // Save the file
        final file = File(outputPath);
        await file.writeAsBytes(bytes);
      } catch (e) {
        throw Exception('Failed to save image: $e');
      }
    }
  }
}
