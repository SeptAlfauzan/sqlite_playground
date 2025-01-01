// file: web_image_saver.dart
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sql_playground/ui/colors.dart';

class WebImageSaver {
  static Future<void> save(Uint8List bytes, String fileName) async {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement()
      ..href = url
      ..download = fileName;

    anchor.click();
    html.Url.revokeObjectUrl(url);

    Fluttertoast.showToast(
      msg: "Success downloaded ERD to download directory",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }
}
