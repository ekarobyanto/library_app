import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/src/utils/pick_image.dart';

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
                ? image!.contains('http')
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
