/// A utility class that provides static constants for string resources used throughout the application.
///
/// This class centralizes the text strings for app dialogues, environment settings, app details,
/// exceptions, date filters, and drawer item titles to promote consistency and ease of maintenance.
class StringRes {
  const StringRes._();
  // App Details
  static const kAppName = "Bizak";
  static const kAppVersion = "0.0.1";
  static const kAppDescription = '''
BizakERP is your business powerhouse helping various businesses to record all their
transactions in a single system. With BizakERP, each business can make informed,
fact-based, timely decisions to remain ahead in the competition. It serves as the
backbone of a business adding strength, transparency, and control to your growing
enterprise.
''';
  static const kAppWebsite = "https://system.bizakerp.com.np/";
  static const kAppEmail = "info@raindropinc.com";
  static const kAppContactNumber = "+9779801842333";

  // Misc
  static const kHowIsExperience = "How is your experience with $kAppName?";
  static const kServices = "Services";
  static const kInventory = "Inventory";
  static const kNonInventory = "Non-Inventory";
  static const kAddAnotherLine = "Add another line";
  static const kExpenseTotal = "Expense Total(NPR)";
  static const kOthers = "Others";
  static const kPercentSymbol = "%";
  static const kTrackInventoryInfo = "Track Inventory for this item";
  static const kSelectLineItem = "Select Line Item";
  static const kVersion = "Version";
  static const kPageNum = "page_number";
  static const kLimit = "no_of_rows";

  // Env
  static const kPaymentEnv = "payment.env";

  static const kId = "id";

  // Storage keys
  static const kUserId = 'user-id';
  static const kAccessTokenKey = 'access_token';
  static const kRefreshTokenKey = 'refresh_token';
  static const kUserDataKey = 'user_data';
  static const kTenantCodeKey = 'tenant_code';
  static const kAccessTokenExpirationKey = 'access_token_expiration';
  static const kRefreshTokenExpirationKey = 'refresh_token_expiration';
  static const kLocaleCode = 'locale-code';
}
