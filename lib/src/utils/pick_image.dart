import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:library_app/src/utils/pick_image_dialog.dart';

/// A function that allows the user to pick an image, crop it, and return the path of the cropped image.
///
/// This function takes a BuildContext as a parameter to show the image picker dialog.
/// It first shows the image picker dialog to choose the image source.
/// Then, it picks the image using ImagePicker based on the selected source.
/// If the picked image is not null, it crops the image using ImageCropper with specified maxWidth and maxHeight.
/// Finally, it returns the path of the cropped image, or null if no image was picked.
///
/// @param context The BuildContext to show the image picker dialog.
/// @return A Future<String> representing the path of the cropped image, or null if no image was picked.
Future<String?> pickImage(BuildContext context) async {
  final source = await showImagePickerDialog(context);
  if (source != null) {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return null;
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    return croppedFile?.path;
  }
  return null;
}
