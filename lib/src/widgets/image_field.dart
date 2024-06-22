import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/src/utils/check_uri.dart';
import 'package:library_app/src/utils/pick_image.dart';

/// Represents a Flutter widget for displaying an image field with the ability to pick an image.
/// The image field can show either a local file or an image from a URL.
///
/// Parameters:
/// - label: The label to display above the image field. Defaults to 'Pick Image' if not provided.
/// - image: The path or URL of the image to display initially.
/// - onImageChanged: A function that will be called when a new image is picked.
///
/// This widget allows the user to tap on the image field to pick a new image using the device's image picker.
/// If the image is a URL, it will be loaded using CachedNetworkImage, otherwise, it will be displayed as a local file.
class ImageField extends StatelessWidget {
  final String? label;
  final String? image; //path or url
  final Function(String)? onImageChanged;

  const ImageField({
    super.key,
    this.label,
    this.image,
    this.onImageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? 'Pick Image',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: const Color(0xFF000000).withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            final imagePath = await pickImage(context);
            if (imagePath == null || onImageChanged == null) return;
            onImageChanged!(imagePath);
          },
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(158, 158, 158, 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: image != null
                ? isStringAUrl(image!)
                    ? CachedNetworkImage(imageUrl: image!)
                    : Image.file(
                        File(image!),
                      )
                : Center(
                    child: Icon(
                      Icons.image,
                      size: 40,
                      color: Colors.grey[400],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
