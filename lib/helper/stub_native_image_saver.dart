import 'dart:typed_data';

class NativeImageSaver {
  static Future<void> save(Uint8List bytes, String fileName) async {
    print("cant start downloading");
    throw UnsupportedError('Cannot use NativeImageSaver on web platform');
  }
}
