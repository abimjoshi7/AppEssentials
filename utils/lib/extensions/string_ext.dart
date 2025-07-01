import 'package:intl/intl.dart';

/// Extension on [String] to provide various string manipulation functionalities.
extension StringCasingExtension on String {
  /// Converts the first character of the string to uppercase and the rest to lowercase.
  String toCapitalized() =>
      isNotEmpty ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  /// Converts each word's first character to uppercase and the rest to lowercase.
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');

  /// Removes all symbols from the string, leaving only alphanumeric characters.
  String removeSymbols() => replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

  /// Formats the string as a number with commas.
  String formatWithCommas() =>
      NumberFormat("#,##0", "en_US").format(num.tryParse(this) ?? 0);

  /// Formats the string number into a readable format with K, M, B, or T suffixes.
  String formatNumber() {
    final value = double.tryParse(this) ?? 0;
    if (value >= 1e12) {
      return '${(value / 1e12).toStringAsFixed(1)}T';
    } else if (value >= 1e9) {
      return '${(value / 1e9).toStringAsFixed(1)}B';
    } else if (value >= 1e6) {
      return '${(value / 1e6).toStringAsFixed(1)}M';
    } else if (value >= 1e3) {
      return '${(value / 1e3).toStringAsFixed(1)}K';
    } else {
      return formatWithCommas();
    }
  }

  /// Parses the string to a number, removing any non-numeric characters.
  num getNum() => num.tryParse(replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
}

/// Extension on [String] to provide validation functionalities.
extension AppValidations on String {
  /// Validates the string as an email address.
  String? validateEmail() {
    final regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (isEmpty) {
      return 'Field cannot be empty';
    } else if (!regex.hasMatch(this)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  /// Validates the string is not empty after trimming.
  String? validateNotEmpty() => trim().isEmpty ? 'Required Field' : null;

  /// Validates the string length is equal to the specified [max] length.
  String? validateNumber(int max) =>
      length == max ? null : 'Number should be equal to $max digits';

  /// Validates the string as a password according to specified rules.
  String? validatePassword() {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegex.hasMatch(this)
        ? null
        : 'Password must be at least 8 characters, including at least one capital letter, one number, and one special symbol';
  }
}

extension ParseDateString on String {
  /// Converts a string representing a date into a [DateTime] object.
  ///
  /// The [format] parameter specifies the expected format of the date string.
  /// If not provided, it defaults to 'MM/dd/yyyy'.
  ///
  /// Throws a [FormatException] if the string cannot be parsed as a valid date
  /// according to the specified format.
  DateTime toDate(
      {List<String> formats = const [
        'yyyy-MM-dd',
        'MM/dd/yyyy',
        'dd/MM/yyyy'
      ]}) {
    for (var format in formats) {
      try {
        DateFormat dateFormat = DateFormat(format);
        return dateFormat.parse(this);
      } catch (e) {
        continue;
      }
    }
    throw FormatException("Invalid date format for string: $this");
  }
}

extension CamelCaseSpacing on String {
  String get addSpacingInCamelCase {
    return replaceAllMapped(
      RegExp(r'([a-z])([A-Z])'),
      (match) => '${match.group(1)} ${match.group(2)}',
    );
  }
}

extension Singularize on String {
  String toSingular() {
    if (endsWith('s')) {
      return substring(0, length - 1);
    }
    return this;
  }
}

extension StringInitials on String? {
  String get initials {
    if (this == null) {
      return '';
    } else {
      List<String> words = this!.trim().split(RegExp(r'\s+'));
      return words.map((word) => word[0].toUpperCase()).join();
    }
  }
}

extension FileTypeExtension on String {
  String get fileType {
    if (!contains('.')) {
      return 'Unknown File Type';
    }

    final extension = split('.').last.toLowerCase();

    switch (extension) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'bmp':
        return 'Image';
      case 'mp4':
      case 'avi':
      case 'mov':
      case 'mkv':
        return 'Video';
      case 'mp3':
      case 'wav':
      case 'aac':
      case 'flac':
        return 'Audio';
      case 'pdf':
        return 'PDF Document';
      case 'doc':
      case 'docx':
        return 'Word Document';
      case 'xls':
      case 'xlsx':
        return 'Excel Spreadsheet';
      case 'ppt':
      case 'pptx':
        return 'PowerPoint Presentation';
      case 'txt':
        return 'Text Document';
      case 'zip':
      case 'rar':
      case '7z':
        return 'Archive';
      case 'html':
      case 'htm':
        return 'HTML Document';
      default:
        return 'Unknown File Type';
    }
  }
}

extension StringCasing on String {
  bool isUpperCase() {
    return this == toUpperCase();
  }

  bool isLowerCase() {
    return this == toLowerCase();
  }
}

extension IntegerExtensions on String {
  int? extractInteger() {
    final match = RegExp(r'\d+').firstMatch(this);
    return match != null ? int.parse(match.group(0)!) : null;
  }
}
