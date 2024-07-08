import 'package:flutter/material.dart';
import 'package:library_app/src/router/router.dart';
import 'package:library_app/src/widgets/application_appbar.dart';
import 'package:library_app/src/widgets/book_list_tile.dart';
import 'package:library_app/src/widgets/searchbar.dart';

class LibrarySearchScreen extends StatefulWidget {
  const LibrarySearchScreen({super.key});

  @override
  State<LibrarySearchScreen> createState() => _LibrarySearchScreenState();
}

class _LibrarySearchScreenState extends State<LibrarySearchScreen> {
  FocusNode focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ApplicationAppbar(
        title: "Find Book",
        onBackButtonPressed: () => router.pop(),
        bottom: AppSearchbar(
          focusNode: focusNode,
          controller: controller,
          padding: const EdgeInsets.all(8.0),
          placeholder: "Search books by name...",
        ),
      ),
      body: ListView.separated(
        itemCount: 12,
        padding: const EdgeInsets.all(8),
        separatorBuilder: (ctx, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) => const BookListTile(),
      ),
    );
  }
}
