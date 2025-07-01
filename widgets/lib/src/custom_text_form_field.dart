part of 'src.dart';

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
    this.value,
    this.maxLines = 1,
    this.readOnly = false,
    this.isRequired = false,
    this.onTap,
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
  final String? value;
  final int? maxLines;
  final bool readOnly;
  final bool isRequired;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      isRequired: isRequired,
      labelText: labelText,
      child: TextFormField(
        initialValue: value,
        onTap: onTap,
        style: TextTheme.of(context).labelLarge?.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
        autofocus: autofocus,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText ??
              switch (keyboardType) {
                TextInputType.number => '0',
                TextInputType.phone => '+977',
                _ => "Tap to enter",
              },
          filled: false,
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
        readOnly: readOnly,
        textInputAction: textInputAction,
        textAlign: TextAlign.end,
      ),
    );
  }
}
