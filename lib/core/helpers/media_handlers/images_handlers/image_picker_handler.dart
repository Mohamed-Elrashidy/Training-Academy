import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

class ImagePickerHandler {
  static Future<String?> singleImagePicker() async {
    try {
      final result = await FilePicker.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      return result?.files.single.path;
    } on PlatformException {
      return null;
    } catch (_) {
      return null;
    }
  }
}
