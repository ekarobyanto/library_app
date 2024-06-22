import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Function to show an image picker dialog with options to pick from camera or gallery.
///
/// @param ctx The BuildContext to show the dialog in.
/// @return A Future<ImageSource> representing the selected image source (camera or gallery).
Future<ImageSource?> showImagePickerDialog(BuildContext ctx) => showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          title: const Text(
            'Pick an image',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: const Text('Camera'),
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.camera),
                onTap: () {
                  Navigator.of(context).pop(ImageSource.camera);
                },
              ),
              ListTile(
                title: const Text('Gallery'),
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.image),
                onTap: () {
                  Navigator.of(context).pop(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
