import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/button.dart';
import 'package:library_app/src/widgets/searchbar.dart';

PreferredSizeWidget libraryAppbar() {
  return AppBar(
    toolbarOpacity: 1,
    scrolledUnderElevation: 0,
    shadowColor: Colors.black12,
    title: const Text('Library'),
    backgroundColor: Colors.white,
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppButton(
          label: "Upload Book",
          onPressed: () => router.push('/create-book'),
        ),
      )
    ],
    bottom: AppSearchbar(
      isEnable: false,
      placeholder: "Find books",
      onPress: () => router.pushNamed('search-books'),
    ),
  );
}
