import 'dart:convert';
import 'dart:developer';

/// An extension on [Map<String, dynamic>] to provide functionality for removing all null values.
///
/// This extension recursively removes all null values from the map and any nested maps or lists,
/// ensuring that the resulting map contains only non-null values. This can be particularly useful
/// for preparing data before serialization or API requests.
extension RemoveNullValues on Map<String, dynamic> {
  /// Removes all null values from the map and any nested structures.
  ///
  /// Returns a new [Map<String, dynamic>] with the same structure but without any null values.
  Map<String, dynamic> removeNullValues() {
    log("Before removing null values: $this");

    // Convert the map to iterable entries, filter them, and convert back to a map.
    var result = Map.fromEntries(
      entries.where((entry) => entry.value != null).map(
        (entry) {
          // Check and recursively remove null values from nested maps and lists.
          if (entry.value is Map<String, dynamic>) {
            return MapEntry(
              entry.key,
              (entry.value as Map<String, dynamic>).removeNullValues(),
            );
          } else if (entry.value is List) {
            return MapEntry(
              entry.key,
              _removeNullValuesFromList(entry.value as List),
            );
          }
          return entry;
        },
      ),
    );

    log("After removing null values: ${jsonEncode(result)}");
    return result;
  }

  /// Helper method to remove null values from a list, including nested maps and lists.
  ///
  /// Returns a new [List<dynamic>] with the same elements but without any null values.
  List<dynamic> _removeNullValuesFromList(List<dynamic> list) => list
      .map((item) {
        if (item is Map<String, dynamic>) {
          return item.removeNullValues();
        } else if (item is List) {
          return _removeNullValuesFromList(item);
        }
        return item;
      })
      .where((item) => item != null)
      .toList();
}
