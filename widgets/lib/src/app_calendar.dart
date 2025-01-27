part of 'src.dart';

class AppCalendar extends StatelessWidget {
  const AppCalendar({
    required this.focusedDay,
    required this.firstDay,
    required this.lastDay,
    super.key,
    this.availableCalendarFormats = const {
      CalendarFormat.month: 'Month',
    },
    this.calendarFormat = CalendarFormat.month,
    this.calendarStyle = const CalendarStyle(),
    this.enabledDayPredicate,
    this.eventLoader,
    this.locale,
    this.onDaySelected,
    this.onHeaderTapped,
    this.onRangeSelected,
    this.rangeSelectionMode = RangeSelectionMode.toggledOn,
    this.selectedDayPredicate,
  });
  final Map<CalendarFormat, String> availableCalendarFormats;
  final CalendarFormat calendarFormat;
  final CalendarStyle calendarStyle;
  final bool Function(DateTime)? enabledDayPredicate;
  final List<Widget> Function(DateTime)? eventLoader;
  final DateTime firstDay;
  final DateTime focusedDay;
  final DateTime lastDay;
  final String? locale;
  final Function(DateTime, DateTime)? onDaySelected;
  final void Function(DateTime)? onHeaderTapped;
  final void Function(DateTime?, DateTime?, DateTime)? onRangeSelected;
  final RangeSelectionMode rangeSelectionMode;
  final bool Function(DateTime)? selectedDayPredicate;

  @override
  Widget build(BuildContext context) {
    return TableCalendar<Widget>(
      availableCalendarFormats: availableCalendarFormats,
      calendarFormat: calendarFormat,
      calendarStyle: calendarStyle,
      enabledDayPredicate: enabledDayPredicate,
      eventLoader: eventLoader,
      focusedDay: focusedDay,
      firstDay: firstDay,
      lastDay: lastDay,
      locale: locale,
      onDaySelected: onDaySelected,
      onHeaderTapped: onHeaderTapped,
      onRangeSelected: onRangeSelected,
      rangeSelectionMode: rangeSelectionMode,
      selectedDayPredicate: selectedDayPredicate,
    );
  }
}
