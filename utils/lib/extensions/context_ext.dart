import 'dart:async';

import 'package:flutter/material.dart';

/// Extension on [BuildContext] to provide utility methods for accessing media query information,
/// text styles, colors, and showing bottom sheets and snack bars.
extension BuildContextEntension<T> on BuildContext {
  // * Core
  /// Returns a [VoidCallback] that pops the current route off the navigator.
  VoidCallback get burn => () => Navigator.pop(this);

  // * Dimensions
  /// Returns true if the device is considered mobile (small width).
  bool get isMobile => MediaQuery.sizeOf(this).width <= 500.0;

  /// Returns true if the device is considered a tablet (medium width).
  bool get isTablet =>
      MediaQuery.sizeOf(this).width < 1024.0 &&
      MediaQuery.sizeOf(this).width >= 650.0;

  /// Returns true if the device is considered a small tablet (between mobile and tablet size).
  bool get isSmallTablet =>
      MediaQuery.sizeOf(this).width < 650.0 &&
      MediaQuery.sizeOf(this).width > 500.0;

  /// Returns true if the device is considered desktop (large width).
  bool get isDesktop => MediaQuery.sizeOf(this).width >= 1024.0;

  /// Returns true if the device has a small width (between mobile and desktop size).
  bool get isSmall =>
      MediaQuery.sizeOf(this).width < 850.0 &&
      MediaQuery.sizeOf(this).width >= 560.0;

  /// Returns the width of the media (screen or window).
  double get width => MediaQuery.sizeOf(this).width;

  /// Returns the height of the media (screen or window).
  double get height => MediaQuery.sizeOf(this).height;

  /// Returns the size of the media (screen or window).
  Size get size => MediaQuery.sizeOf(this);

  // * Text styles
  TextStyle? get displayLarge => TextTheme.of(this).displayLarge;

  TextStyle? get displayMedium => TextTheme.of(this).displayMedium;

  TextStyle? get displaySmall => TextTheme.of(this).displaySmall;

  TextStyle? get headlineLarge => TextTheme.of(this).headlineLarge;

  TextStyle? get headlineMedium => TextTheme.of(this).headlineMedium;

  TextStyle? get headlineSmall => TextTheme.of(this).headlineSmall;

  TextStyle? get titleLarge => TextTheme.of(this).titleLarge;

  TextStyle? get titleMedium => TextTheme.of(this).titleMedium;

  TextStyle? get titleSmall => TextTheme.of(this).titleSmall;

  TextStyle? get bodyLarge => TextTheme.of(this).bodyLarge;

  TextStyle? get bodyMedium => TextTheme.of(this).bodyMedium;

  TextStyle? get bodySmall => TextTheme.of(this).bodySmall;

  TextStyle? get labelLarge => TextTheme.of(this).labelLarge;

  TextStyle? get labelMedium => TextTheme.of(this).labelMedium;

  TextStyle? get labelSmall => TextTheme.of(this).labelSmall;

  TextStyle? get labelSmallDisabled => this.labelSmall?.copyWith(
        color: this.disabledColor,
      );

  // * Colors
  Color get primaryColorDark => Theme.of(this).primaryColorDark;

  Color get primaryColorLight => Theme.of(this).primaryColorLight;

  Color get primary => Theme.of(this).colorScheme.primary;

  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  Color get secondary => Theme.of(this).colorScheme.secondary;

  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  Color get tertiary => Theme.of(this).colorScheme.tertiary;

  Color get onTertiary => Theme.of(this).colorScheme.onTertiary;

  Color get canvasColor => Theme.of(this).canvasColor;

  Color get cardColor => Theme.of(this).cardColor;

  Color get disabledColor => Theme.of(this).disabledColor;

  Color get focusColor => Theme.of(this).focusColor;

  Color get highlightColor => Theme.of(this).highlightColor;

  Color get hintColor => Theme.of(this).hintColor;

  Color get indicatorColor => Theme.of(this).indicatorColor;

  Color get errorColor => Theme.of(this).colorScheme.error;

  Color get background => Theme.of(this).colorScheme.surface;

  Color get unselectedWidgetColor => Theme.of(this).unselectedWidgetColor;

  // * Check if theme is dark
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  // * Popups
  /// Shows a modal bottom sheet with the given [child] widget.
  /// Additional customization options are available via named parameters.
  Future<S?> showAppModalSheet<S>(
    Widget child, {
    bool isScrollControlled = true,
    bool useSafeArea = true,
    Key? scaffoldMessengerKey,
    Color? backgroundColor,
    Color? barrierColor,
    BoxConstraints? constraints,
    bool? showDragHandle,
    bool isDismissible = true,
    bool enableDrag = false,
    bool canPop = true,
  }) {
    // Cache the MediaQuery data to avoid multiple lookups.
    return showModalBottomSheet<S>(
      enableDrag: enableDrag,
      showDragHandle: showDragHandle,
      context: this,
      isScrollControlled: isScrollControlled,
      useSafeArea: useSafeArea,
      barrierColor: barrierColor,
      backgroundColor: backgroundColor,
      isDismissible: isDismissible,
      constraints: constraints,
      builder: (context) {
        return ScaffoldMessenger(
          key: scaffoldMessengerKey,
          child: PopScope(
            canPop: canPop,
            onPopInvokedWithResult: (didPop, result) async {
              if (didPop) return;

              final bool? shouldPop = await showDialog(
                barrierDismissible: true,
                context: context,
                builder: (context) => const _ExitFormDialog(),
              );

              if (shouldPop ?? false) {
                Navigator.pop(this);
              }
            },
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom,
                left: 8,
                right: 8,
                top: 8,
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }

  void showOverlaySnackBar({
    String? message,
    bool isSuccessful = false,
    bool showAction = false,
    VoidCallback? onPressed,
  }) async {
    final overlay = Overlay.of(this);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.viewInsetsOf(context).bottom + 10,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: SnackBar(
            action: showAction
                ? SnackBarAction(
                    label: "Go",
                    onPressed: onPressed ?? () {},
                  )
                : null,
            elevation: 4,
            animation: kAlwaysCompleteAnimation,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(16),
            showCloseIcon: true,
            content: Row(
              children: [
                Icon(
                  isSuccessful
                      ? Icons.done_rounded
                      : Icons.warning_amber_rounded,
                  color: isSuccessful ? this.tertiary : errorColor,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    message ??
                        (isSuccessful
                            ? "Saved Successfully"
                            : "A problem occured"),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    await Future<void>.delayed(
      const Duration(
        seconds: 2,
      ),
    ).then(
      (_) => overlayEntry.remove(),
    );
  }
}

class _ExitFormDialog extends StatelessWidget {
  const _ExitFormDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: const Text("Exit Form?"),
      content: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Are you sure you want to exit? Any changes will be lost."),
          // Uncomment and manage the state for the checkbox if needed
          // _buildCheckbox(),
        ],
      ),
      actions: [
        _buildDialogButton(
          context: context,
          label: "Cancel",
          onPressed: () => Navigator.pop(context, false),
          isOutlined: true,
        ),
        _buildDialogButton(
          context: context,
          label: "OK",
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    );
  }

  Widget _buildDialogButton({
    required BuildContext context,
    required String label,
    required VoidCallback onPressed,
    bool isOutlined = false,
  }) {
    return isOutlined
        ? OutlinedButton(onPressed: onPressed, child: Text(label))
        : ElevatedButton(onPressed: onPressed, child: Text(label));
  }

// Uncomment and manage the state for the checkbox if needed
// Widget _buildCheckbox() {
//   return Row(
//     children: [
//       Checkbox(
//         value: false,
//         onChanged: (value) {},
//       ),
//       const Text("Do not show this message again"),
//     ],
//   );
// }
}
