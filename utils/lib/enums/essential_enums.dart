enum Modules {
  SalesInvoices,
  PurchaseOrders,
  CreditNote,
  Payment,
}

enum VendorType {
  Unknown,
  Company,
  Individual,
}

enum Masters {
  Item,
  Unit,
  Currency,
  Vendor,
  Customer,
  Subsidiary,
  Location,
  Ledger,
}

enum Transaction {
  Purchase,
  Sales,
  Expense,
  Income,
}

enum TransactionType {
  SalesInvoice,
  PurchaseOrder,
  RecurringInvoices,
}

enum SupportState {
  unknown,
  supported,
  unsupported,
}

enum Filters {
  Date,
  Transaction,
  Category,
  Payment,
}

enum AccountType {
  debit,
  credit,
}

enum PaymentType {
  cash,
  bank,
}

enum PaymentMethod {
  Cash,
  Cheque,
  Online,
  Credit,
}

enum ApprovalStatus {
  Unknown,
  Pending,
  Approved,
  Rejected,
}

// enum HomeElements {
//   Inventory,
//   Finance,
//   Transaction,
// }

enum LedgerRateType {
  Current,
  Average,
  Historical,
}

enum ReportType {
  General,
  Customer,
  Vendor,
  // Bank,
}

enum PayeeType {
  Customer(40),
  Vendor(33),
  Employee(37),
  Contact(42);

  final int id;

  const PayeeType(this.id);
}

enum StatusType {
  Draft,
  Pending,
  Approved,
  Verified,
  Cancelled,
  Completed,
  Error,
  Archived,
  Scheduled,
}

enum Honorific {
  Mr,
  Mrs,
  Ms,
  Dr,
  Prof,
}

enum Religion {
  Hinduism,
  Buddhism,
  Islam,
  Christianity,
  Sikhism,
  Kirat,
  Jainism,
}

enum MaritalStatus {
  Single,
  Married,
  Divorced,
  Widowed,
}

enum JobType {
  FullTime,
  PartTime,
  Contract,
  Temporary,
  Internship,
  Remote,
}

enum ActorType {
  Customer,
  Vendor,
  Employee,
  Contact,
}

enum DefaultAccounts {
  LANDS,
  BUILDINGS_AND_CIVIL_STRUCTURES,
  MACHINERY_AND_EQUIPMENT,
  COMPUTER_AND_OFFICE_EQUIPMENT,
  VEHICLES,
  FURNITURE_FIXTURES_AND_FITTINGS,
  SOFTWARE,
  BRANDS_TRADEMARKS_AND_COPYRIGHTS,
  DEFERRED_TAX_ASSETS,
  TRADE_INVESTMENT,
  INVENTORY_ASSETS,
  ACCOUNTS_RECEIVABLES,
  PETTY_CASH,
  BANK,
  ADVANCE_TAX,
  EMPLOYEE_ADVANCE,
  PREPAID_EXPENSES,
  OWNERS_EQUITY,
  OPENING_BALANCE_OFFSET,
  DRAWINGS,
  LONG_TERM_LOAN,
  DEFERRED_TAX_LIABILITIES,
  SHORT_TERM_LOAN,
  ACCOUNTS_PAYABLE,
  PROVISION_FOR_EMPLOYEE_BENEFITS,
  ACCRUALS,
  DIVIDEND_PAYABLES,
  SALARY_PAYABLES,
  TAX_PAYABLE,
  INTEREST_PAYABLES,
  TDS_PAYABLES,
  VAT_OUTPUT,
  OTHER_PAYABLES,
  SALES,
  DISCOUNT,
  GENERAL_INCOME,
  FINANCE_INCOME,
  INVESTMENT_INCOME,
  COST_OF_GOOD_SOLD,
  ADVERTISING_AND_MARKETING,
  AUTOMOBILE_EXPENSE,
  BAD_DEBT,
  BANK_FEES_AND_CHARGES,
  CONSULTANT_EXPENSE,
  CREDIT_CARD_CHARGES,
  DEPRECIATION_EXPENSE,
  IT_AND_INTERNET_EXPENSE,
  JANITORIAL_EXPENSES,
  LODGING,
  MEALS_AND_ENTERTAINMENT,
  OFFICE_SUPPLIES,
  OTHER_EXPENSES,
  POSTAGE,
  PRINTING_AND_STATIONERY,
  PURCHASE_DISCOUNTS,
  RENT_EXPENSE,
  REPAIRS_AND_MAINTENANCE,
  SALARIES_AND_EMPLOYEE_WAGES,
  TELEPHONE_EXPENSE,
  TRAVEL_EXPENSE,
  INSURANCE
}

enum AccountGroup {
  FixedAsset,
  DeferredTaxAssets,
  Investment,
  CurrentAssets,
  AccountsReceivable,
  CashAndCashEquivalents,
  OtherCurrentAssets,
  Equity,
  NonCurrentLiabilities,
  DeferredTaxLiabilities,
  CurrentLiabilities,
  AccountsPayable,
  ShortTermProvisions,
  OtherCurrentLiabilities,
  Income,
  CostOfGoodsSold,
  Expense,
}

enum RoleType {
  Admin("Admin", "Unrestricted access to all modules"),
  Staff("Staff", "Access to all modules except reports, settings and accounts"),
  TS("TimesheetStaff", "Timesheet staff role"),
  AC("Staff(Assigned Customers Only)",
      "Access to all modules, transactions and data of assigned customers and all vendors except banking, reports, settings and accountant.");

  final String label;
  final String description;

  const RoleType(this.label, this.description);
}

enum ItemSubtype {
  Purchase("For Purchase"),
  Sales("For Sales"),
  Resale("For Resale");

  final String title;
  const ItemSubtype(this.title);
}

enum PriorityType {
  Low(1),
  Medium(2),
  High(3),
  Urgent(4);

  final int id;
  const PriorityType(this.id);
}

enum TaskStatus {
  InProgress(1, "In Progress"),
  Completed(2, "Completed");

  final int id;
  final String name;
  const TaskStatus(this.id, this.name);
}

enum EventStatus {
  Confirmed,
  Cancelled,
  Tentative,
}

enum EventAccess {
  Public("Public"),
  Private("Private"),
  ShowAsBusy("Show as Busy");

  final String title;
  const EventAccess(this.title);
}

enum BankAccountType {
  Saving("Saving Account"),
  Current("Current Account"),
  Call("Call Account"),
  FixedDeposit("Fixed Deposit");

  final String title;
  const BankAccountType(this.title);
}
