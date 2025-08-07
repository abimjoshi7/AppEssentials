part of 'src.dart';

class DatePickerFormfield extends StatelessWidget {
  const DatePickerFormfield({
    required this.onChanged,
    super.key,
    this.date,
    String? labelText = "Date",
    this.isRequired = false,
  }) : _labelText = labelText;

  final DateTime? date;
  final ValueChanged<DateTime> onChanged;
  final String? _labelText;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    final formattedDate = date != null
        ? '${date!.day.toString().padLeft(2, '0')} ${_getMonthName(date!.month)} ${date!.year}'
        : '';
    return CustomFormField(
      labelText: _labelText,
      isRequired: isRequired,
      child: CustomTextFormField(
        readOnly: true,
        controller: TextEditingController(text: formattedDate.toString()),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: date ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );

          if (pickedDate != null && pickedDate != date) {
            onChanged(pickedDate);
          }
        },
      ),
    );
  }
}

String _getMonthName(int month) {
  const monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return monthNames[month - 1];
}
