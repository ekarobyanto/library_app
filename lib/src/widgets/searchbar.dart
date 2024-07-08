import 'package:flutter/material.dart';
import 'package:library_app/src/theme/app_theme.dart' as theme;

class AppSearchbar extends StatelessWidget implements PreferredSizeWidget {
  final String? placeholder;
  final void Function(String)? onSearch;
  final FocusNode? focusNode;
  final bool? isEnable;
  final void Function()? onPress;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Clip clipBehavior = Clip.none;
  final TextEditingController? controller;

  const AppSearchbar({
    super.key,
    this.placeholder,
    this.onSearch,
    this.focusNode,
    this.isEnable,
    this.onPress,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'searchbar',
      child: Container(
        padding: padding,
        color: color,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        width: width,
        height: height,
        constraints: constraints,
        margin: margin,
        transform: transform,
        transformAlignment: transformAlignment,
        alignment: alignment,
        child: GestureDetector(
          onTap: onPress,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              controller: controller,
              enabled: isEnable ?? true,
              focusNode: focusNode,
              cursorColor: theme.color.primaryColor,
              textAlignVertical: TextAlignVertical.center,
              onSubmitted: (value) => onSearch?.call(value),
              decoration: InputDecoration(
                isDense: true,
                alignLabelWithHint: true,
                border: InputBorder.none,
                hintText: placeholder ?? 'Search',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight((kToolbarHeight));
}
