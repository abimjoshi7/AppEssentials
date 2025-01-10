import 'package:flutter/material.dart';

/// An extension on [num] to provide convenient shorthand properties for creating [SizedBox] and [EdgeInsets].
///
/// This extension allows for quick and readable inline creation of commonly used layout widgets
/// with dimensions or padding based on the numeric value.
extension SizedBoxExt on num {
  /// Creates a [SizedBox] with a height equal to the current number.
  ///
  /// This is useful for adding vertical spacing in a layout.
  SizedBox get heightBox => SizedBox(
        height: toDouble(),
      );

  /// Creates a [SizedBox] with a width equal to the current number.
  ///
  /// This is useful for adding horizontal spacing in a layout.
  SizedBox get widthBox => SizedBox(
        width: toDouble(),
      );

  /// Creates an [EdgeInsets] with all sides equal to the current number.
  ///
  /// This is useful for adding uniform padding around a widget.
  EdgeInsets get paddingAll => EdgeInsets.all(
        toDouble(),
      );
}

extension NullChecker on num {
  bool get isNull => this < 1;
}
