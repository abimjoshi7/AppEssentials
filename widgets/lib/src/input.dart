part of 'src.dart';

/// A utility class for common input decorations
class InputDecorationUtils {
  static InputDecoration baseDecoration({
    required String labelText,
    IconData? iconData,
    String? prefix,
    String? helperText,
    String? hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      helperText: helperText,
      labelText: labelText,
      prefixText: prefix,
      prefixIcon: iconData != null
          ? Icon(
              iconData,
              size: 20,
            )
          : null,
      prefixIconConstraints: const BoxConstraints(minWidth: 60),
      hintText: hintText,
      suffixIcon: suffixIcon,
    );
  }
}

/// Custom select dropdown widget
class CustomSelect extends StatelessWidget {
  final TextEditingController controller;
  final List<Map<String, dynamic>> items;
  final String? Function(String?)? validator;
  final String labelText;

  const CustomSelect({
    required this.controller,
    required this.items,
    this.validator,
    this.labelText = "Select Type",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: validator ??
          (value) =>
              (value == null || value.isEmpty) ? 'Please Enter Type' : null,
      items: items.map((value) {
        return DropdownMenuItem<String>(
          value: value['id'].toString(),
          child: Text(value['name']),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          controller.text = value;
        }
      },
      decoration: InputDecorationUtils.baseDecoration(labelText: labelText),
    );
  }
}

/// Base text field with common functionality
class BaseTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool readOnly;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  const BaseTextField({
    required this.labelText,
    required this.controller,
    this.hintText,
    this.validator,
    this.obscureText = false,
    this.readOnly = false,
    this.keyboardType,
    this.inputFormatters,
    this.suffixIcon,
    this.onChanged,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      readOnly: readOnly,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onTap: onTap,
      decoration: InputDecorationUtils.baseDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}

/// Standard text field
class MLTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const MLTextField({
    required this.labelText,
    required this.controller,
    this.hintText,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      validator: validator,
    );
  }
}

/// Number input field
class MLNumberField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool readOnly;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  const MLNumberField({
    required this.labelText,
    required this.controller,
    this.validator,
    this.hintText,
    this.readOnly = false,
    this.onChanged,
    this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      labelText: labelText,
      controller: controller,
      validator: validator,
      hintText: hintText,
      readOnly: readOnly,
      onChanged: onChanged,
      keyboardType: keyboardType ?? TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
      ],
    );
  }
}

/// Password field with visibility toggle
class MLPasswordField extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const MLPasswordField({
    required this.labelText,
    required this.controller,
    this.hintText,
    this.validator,
    super.key,
  });

  @override
  State<MLPasswordField> createState() => _MLPasswordFieldState();
}

class _MLPasswordFieldState extends State<MLPasswordField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      labelText: widget.labelText,
      hintText: widget.hintText,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: !_passwordVisible,
      suffixIcon: IconButton(
        icon: Icon(
          _passwordVisible ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          setState(() {
            _passwordVisible = !_passwordVisible;
          });
        },
      ),
    );
  }
}

/// Select/dropdown field
class MLSelectField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? value;
  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;

  const MLSelectField({
    required this.labelText,
    required this.controller,
    required this.items,
    this.validator,
    this.hintText,
    this.value,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      validator: validator,
      items: items,
      initialValue: value,
      onChanged: (value) {
        if (value != null) {
          controller.text = value;
          onChanged?.call(value);
        }
      },
      decoration: InputDecorationUtils.baseDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}

/// Date and time picker field
class MLDateTimeField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String dateFormat;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const MLDateTimeField({
    required this.labelText,
    required this.controller,
    this.hintText,
    this.onChanged,
    this.dateFormat = "yyyy-MM-dd HH:mm:ss",
    super.key,
  });

  Future<void> _selectDateTime(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate == null) return;

    if (!context.mounted) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime == null) return;

    final dateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    final formattedDate = DateFormat(dateFormat).format(dateTime);
    controller.text = formattedDate;
    onChanged?.call(formattedDate);
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      labelText: labelText,
      controller: controller,
      hintText: hintText,
      readOnly: true,
      onTap: () => _selectDateTime(context),
      suffixIcon: const Icon(Icons.calendar_today),
    );
  }
}

/// Date picker field
class MLDateField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String dateFormat;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const MLDateField({
    required this.labelText,
    required this.controller,
    this.hintText,
    this.onChanged,
    this.dateFormat = "yyyy-MM-dd",
    super.key,
  });

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat(dateFormat).format(pickedDate);
      controller.text = formattedDate;
      onChanged?.call(formattedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      labelText: labelText,
      controller: controller,
      hintText: hintText,
      readOnly: true,
      onTap: () => _selectDate(context),
      suffixIcon: const Icon(Icons.calendar_today),
    );
  }
}

/// Number field with increment/decrement buttons
class MLNumberFieldWithButton extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final int minValue;
  final int maxValue;
  final TextInputType? keyboardType;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

  const MLNumberFieldWithButton({
    super.key,
    required this.controller,
    required this.labelText,
    this.minValue = 0,
    this.maxValue = 10,
    this.keyboardType,
    this.readOnly = false,
    this.inputFormatters,
  });

  @override
  State<MLNumberFieldWithButton> createState() =>
      _MLNumberFieldWithButtonState();
}

class _MLNumberFieldWithButtonState extends State<MLNumberFieldWithButton> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = int.tryParse(widget.controller.text) ?? widget.minValue;
    widget.controller.text = _currentValue.toString();
  }

  void _increment() {
    if (_currentValue < widget.maxValue) {
      setState(() {
        _currentValue++;
        widget.controller.text = _currentValue.toString();
      });
    }
  }

  void _decrement() {
    if (_currentValue > widget.minValue) {
      setState(() {
        _currentValue--;
        widget.controller.text = _currentValue.toString();
      });
    }
  }

  void _handleTextChange(String value) {
    final parsedValue = int.tryParse(value);
    if (parsedValue != null &&
        parsedValue >= widget.minValue &&
        parsedValue <= widget.maxValue) {
      setState(() {
        _currentValue = parsedValue;
      });
    } else {
      widget.controller.text = _currentValue.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: _decrement,
              icon: const Icon(Icons.remove),
            ),
          ),
          Expanded(
            flex: 3,
            child: BaseTextField(
              readOnly: widget.readOnly,
              controller: widget.controller,
              keyboardType: widget.keyboardType ?? TextInputType.number,
              inputFormatters: widget.inputFormatters,
              onChanged: _handleTextChange,
              labelText: widget.labelText,
            ),
          ),
          Expanded(
            flex: 2,
            child: IconButton(
              onPressed: _increment,
              icon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
