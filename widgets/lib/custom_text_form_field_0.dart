import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utils/utils.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
    this.autofocus = false,
    this.textInputAction,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.focusNode,
    this.onChanged,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.autovalidateMode,
    this.maxLines = 1,
    this.readOnly = false,
    this.isRequired = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final int? maxLines;
  final bool readOnly;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Row(
            children: [
              Text(
                labelText!,
                style: context.labelLarge,
              ),
              Visibility(
                visible: isRequired,
                child: Text(
                  " *",
                  style: context.labelLarge?.copyWith(
                    color: kClrRed,
                  ),
                ),
              ),
            ],
          ),
        4.heightBox,
        TextFormField(
          autofocus: autofocus,
          autovalidateMode: autovalidateMode,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: readOnly
                  ? context.hintColor.withAlpha(255)
                  : context.disabledColor,
            ),
            filled: true,
            suffixIconConstraints: BoxConstraints.tight(const Size(25, 30)),
            suffixIcon: FittedBox(
              fit: BoxFit.scaleDown,
              child: suffixIcon,
            ),
            prefixIcon: prefixIcon,
          ),
          scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          focusNode: focusNode,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          maxLines: maxLines,
          obscureText: obscureText,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          readOnly: readOnly,
          textInputAction: textInputAction,
          validator: validator,
        ),
      ],
    );
  }
}
