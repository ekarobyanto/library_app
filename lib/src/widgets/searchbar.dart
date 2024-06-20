import 'package:flutter/material.dart';

class AppSearchbar extends StatelessWidget {
  final String? placeholder;
  final void Function(String)? onSearch;
  final FocusNode? focusNode;
  final bool? isEnable;
  final void Function()? onPress;

  const AppSearchbar({
    super.key,
    this.placeholder,
    this.onSearch,
    this.focusNode,
    this.isEnable,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          enabled: isEnable ?? true,
          focusNode: focusNode,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: placeholder ?? 'Search',
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.search),
            alignLabelWithHint: true,
            isDense: true,
          ),
        ),
      ),
    );
  }
}
