import 'package:flutter/material.dart';
import 'package:library_app/src/theme/app_theme.dart';

class AppTextField extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final String? Function(String? value)? onValidate;
  final bool? obscureText;
  final TextStyle? labelStyle;
  final String? placeholder;
  final Icon? leftIcon;
  final int? minLines;
  final int? maxLines;
  final Function()? onTap;
  final bool? enabled;

  const AppTextField({
    super.key,
    this.controller,
    this.onValidate,
    this.label,
    this.obscureText,
    this.labelStyle,
    this.placeholder,
    this.leftIcon,
    this.minLines,
    this.maxLines,
    this.onTap,
    this.enabled,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  void initState() {
    obsecureText = (widget.obscureText ?? false);
    super.initState();
  }

  bool obsecureText = false;

  void toggleObsecure() => setState(() => obsecureText = !obsecureText);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                widget.label!,
                style: widget.labelStyle ??
                    TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF000000).withOpacity(0.6),
                    ),
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 8),
        TextFormField(
          minLines: widget.minLines ?? 1,
          maxLines: widget.maxLines ?? 1,
          enabled: (widget.enabled ?? true),
          onTap: widget.onTap,
          controller: widget.controller,
          validator: widget.onValidate,
          cursorColor: color.primaryColor,
          obscureText: (obsecureText) ? obsecureText : false,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            contentPadding: EdgeInsets.all(constraints.large),
            filled: true,
            isDense: true,
            fillColor: const Color.fromRGBO(158, 158, 158, 0.1),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(constraints.medium),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(constraints.medium),
              borderSide: BorderSide(
                color: color.primaryColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(constraints.medium),
              borderSide: BorderSide(
                color: color.primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(constraints.medium),
              borderSide: BorderSide(
                color: color.danger,
              ),
            ),
            errorStyle: TextStyle(
              color: color.danger,
            ),
            prefixIcon: (widget.leftIcon != null) ? widget.leftIcon : null,
            suffixIcon: (widget.obscureText != null)
                ? IconButton(
                    onPressed: toggleObsecure,
                    icon: (obsecureText)
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
