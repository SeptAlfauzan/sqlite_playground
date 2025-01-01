// file: stub_web_image_saver.dart
import 'dart:typed_data';

class WebImageSaver {
  static Future<void> save(Uint8List bytes, String fileName) async {
    throw UnsupportedError('Cannot use WebImageSaver on non-web platforms');
  }
}
