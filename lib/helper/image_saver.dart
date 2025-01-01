import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;

// Web-specific imports
import 'stub_native_image_saver.dart'
    if (dart.library.io) 'native_image_saver.dart';

// Mobile/Desktop specific imports
import 'stub_web_image_saver.dart'
    if (dart.library.html) 'web_image_saver.dart';

class ImageSaver {
  static Future<void> saveImage(
      {required Uint8List bytes, String? fileName}) async {
    fileName ??= 'erd_diagram_${DateTime.now().millisecondsSinceEpoch}.png';

    if (kIsWeb) {
      await WebImageSaver.save(bytes, fileName);
    } else {
      print("download on mobile");
      await NativeImageSaver.save(bytes, fileName);
    }
  }
}
