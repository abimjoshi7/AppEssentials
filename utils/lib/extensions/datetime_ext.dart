import 'package:intl/intl.dart';

/// Extension on [DateTime] to provide a utility method for retrieving month names.
extension MonthGetter on DateTime {
  /// A map of month numbers to their corresponding names.
  static final Map<int, String> _months = {
    DateTime.january: 'January',
    DateTime.february: 'February',
    DateTime.march: 'March',
    DateTime.april: 'April',
    DateTime.may: 'May',
    DateTime.june: 'June',
    DateTime.july: 'July',
    DateTime.august: 'August',
    DateTime.september: 'September',
    DateTime.october: 'October',
    DateTime.november: 'November',
    DateTime.december: 'December',
  };

  /// Gets the map of month numbers to their corresponding names.
  Map<int, String> get getMonths => _months;
}

/// Extension on [DateTime] to provide a method for comparing dates without considering time.
extension DateOnlyCompare on DateTime {
  /// Determines if the current date is the same as the provided [other] date, ignoring time.
  ///
  /// Returns `true` if the year, month, and day are the same for both dates, otherwise `false`.
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}

extension SerializedDate on DateTime {
  /// May 6, 2024
  String get dMy => DateFormat.yMMMd().format(this);

  /// 2000-1-1
  String get ymd => DateFormat("yyyy-MM-dd").format(this);

  /// Jan 26, 2024 5:30 PM
  String get dMyHm => DateFormat("MMM d, yyyy h:mm a").format(this);
}
