import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_app/src/utils/pick_image_dialog.dart';

Future<String?> pickImage(BuildContext context) async {
  final source = await showImagePickerDialog(context);
  if (source != null) {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return null;
    final croppedFile =
        await ImageCropper().cropImage(sourcePath: pickedFile.path);
    return croppedFile?.path;
  }
  return null;
}
