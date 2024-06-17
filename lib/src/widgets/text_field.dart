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

  const AppTextField({
    super.key,
    this.controller,
    this.onValidate,
    this.label,
    this.obscureText,
    this.labelStyle,
    this.placeholder,
    this.leftIcon,
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
          controller: widget.controller,
          validator: widget.onValidate,
          obscureText: (obsecureText) ? obsecureText : false,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            contentPadding: EdgeInsets.all(constraints.medium),
            filled: true,
            isDense: true,
            fillColor: const Color.fromRGBO(158, 158, 158, 0.1),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(constraints.large),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(constraints.large),
              borderSide: BorderSide(
                color: color.primaryColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(constraints.large),
              borderSide: BorderSide(
                color: color.primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(constraints.large),
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
