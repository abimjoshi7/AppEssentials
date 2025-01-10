import 'package:flutter/material.dart';

/// A utility class that provides a list of icons used in the app's drawer.
///
/// This class centralizes the icon resources for better management and consistency across the app.
class DrawableRes {
  const DrawableRes._();

  /// A static getter that returns a list of [Icon] widgets for the drawer items.
  ///
  /// Each icon represents a different section or functionality within the app.
  static List<IconData> get kDrawerItemsIcon => [
        kIconGroup,
        kIconWallet,
        kIconUserCircle,
        kIconInventory,
        kIconCustomers,
        kIconSettings,
        // Add more icons as needed
      ];

  // Private icon definitions for better organization and readability.

  static const kIconHome = Icons.home_filled;
  static const kIconGroup = Icons.groups_2_outlined;
  static const kIconWallet = Icons.account_balance_wallet_outlined;
  static const kIconUserCircle = Icons.supervised_user_circle_outlined;
  static const kIconSettings = Icons.settings;
  static const kIconInventory = Icons.inventory_2_outlined;
  static const kIconPayment = Icons.payments;
  static const kIconReceipt = Icons.receipt;
  static const kIconAnalytics = Icons.analytics;
  static const kIconItem = Icons.shopping_bag;
  static const kIconBank = Icons.account_balance;
  static const kIconCustomers = Icons.group_outlined;
  static const kIconInvoice = Icons.receipt_long;
  static const kIconRecurringInvoice = Icons.autorenew_rounded;
  static const kIconOrder = Icons.trolley;
  static const kIconVendors = Icons.storefront;
  static const kIconExpense = Icons.wallet;
  static const kIconLocation = Icons.location_city;
  static const kIconEmployee = Icons.groups;
  static const kIconContact = Icons.contacts;
  static const kIconUnit = Icons.scale;
  static const kIconAccount = Icons.account_tree;
  static const kIconProject = Icons.precision_manufacturing;
  static const kIconReport = Icons.summarize_rounded;
  static const kIconMasterSettings = Icons.settings_suggest_sharp;
  static const kIconDiscountTaxSettings = Icons.discount;
  static const kIconFeedback = Icons.feedback;
  static const kIconShare = Icons.share;
  static const kIconRate = Icons.star;
  static const kIconAboutUs = Icons.help;
  static const kIconRupee = Icons.currency_rupee;
  static const kIconPreferences = Icons.tune;
  static const kIconTax = Icons.percent;
  static const kIconMoodGood = Icons.mood;
  static const kIconMoodBad = Icons.mood_bad;
  static const kIconMoodOkay = Icons.face;
  static const kIconLanguage = Icons.language;
  static const kIconVisit = Icons.merge_rounded;
  static const kIconCalendar = Icons.calendar_month_rounded;
  static const kIconModules = Icons.view_module_rounded;
  static const kIconAutoNumbering = Icons.format_list_numbered_rounded;

  static IconData getIconByKey(String key) {
    switch (key) {
      case 'Customers':
        return DrawableRes.kIconCustomers;
      case 'Vendors':
        return DrawableRes.kIconVendors;
      case 'Items':
        return DrawableRes.kIconItem;
      case 'Invoices':
        return DrawableRes.kIconRecurringInvoice;
      case 'Orders':
        return DrawableRes.kIconOrder;
      case 'Projects':
        return DrawableRes.kIconProject;
      case 'Expense':
        return DrawableRes.kIconExpense;
      case 'Payment':
        return DrawableRes.kIconPayment;
      default:
        return Icons.help_outline; // Default icon if key not found
    }
  }
}
