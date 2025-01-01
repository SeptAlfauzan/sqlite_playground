import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sql_playground/ui/colors.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';

class NativeImageSaver {
  static Future<void> save(Uint8List bytes, String fileName) async {
    print("start downloading");
    if (Platform.isAndroid || Platform.isIOS) {
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      }
      //   final result = await ImageGallerySaver.saveImage(bytes, quality: 60, name: "hello");
      final directory = Platform.isIOS
          ? await getApplicationDocumentsDirectory()
          : Directory('/storage/emulated/0/Download');

      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);
      await file.writeAsBytes(bytes);
      print('Saved to: $filePath');
      Fluttertoast.showToast(
        msg: "Success downloaded ERD to download directory",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 12.0,
        backgroundColor: AppColors.darkerGrey,
        textColor: AppColors.lightGrey,
      );
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      // Desktop: Let user choose save location
      final outputPath = await FilePicker.platform.saveFile(
        dialogTitle: 'Save ERD diagram',
        fileName: fileName,
        allowedExtensions: ['png'],
        type: FileType.custom,
      );
      print(outputPath);
    } else {
      throw UnsupportedError('Cannot use NativeImageSaver on web platform');
    }
  }
}
