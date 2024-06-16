import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

imageuploadcamera() async {
  final XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 50);
  if (file != null) {
    return File(file.path);
  } else {
    null;
  }
}

fileupload() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ["png", "PNG", "JPG", "jpg", "jpeg", "JPEG"]);
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    null;
  }
}
