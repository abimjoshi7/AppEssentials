// Item Filters
enum ItemFilters {
  All,
  Active,
  LowStock,
  Inactive,
  Sales,
  Purchases,
  Services,
  Inventory,
  NonInventory,
}

enum ItemTransactions {
  All,
  Draft,
  Sent,
  ClientViewed,
  Accepted,
  Invoiced,
  Declined,
  Expired
}

// Customer Filters
enum CustomerFilters {
  AllCustomers,
  ActiveCustomers,
  CrmCustomers,
  DuplicateCustomers,
  InactiveCustomers,
  CustomerPortalEnabled,
  CustomerPortalDisabled,
  OverdueCustomers,
  UnpaidCustomers,
}

enum CustomerTransactions {
  Invoice,
  CustomerPayment,
  SalesInvoice,
  RecurringInvoice,
  Expense,
  Project,
  Journal,
  PurchaseOrder;
}

enum CustomerInvoiceTxns {
  All,
  Draft,
  ClientViewed,
  PartiallyPaid,
  Unpaid,
  Overdue,
  Paid,
  Void,
}

enum CustomerRecurringInvoiceTxns {
  All,
  Active,
  Stopped,
  Expired,
}

enum CustomerExpenseTxns {
  All,
  Unbilled,
  Invoiced,
  Reimbursed,
  Billable,
  NonBillable,
  WithReceipts,
  WithoutReceipts,
}

enum CustomerProjectTxns {
  All,
  Active,
  Inactive,
}

enum VendorTransactions {
  Invoice,
  CustomerPayment,
  SalesInvoice,
  RecurringInvoice,
  Expense,
  Project,
  Journal,
  PurchaseOrder;
}

enum BillFilters {
  AllBills,
  DraftBills,
  PendingApprovalBills,
  OpenBills,
  OverdueBills,
  UnpaidBills,
  PariallyPaidBills,
  PaidBills,
  VoidBills,
}

enum InvoiceFilters {
  AllInvoices,
  DraftInvoices,
  LockedInvoices,
  InvoicesPendingApproval,
  ApprovedInvoices,
  CustomerViewedInvoices,
  PariallyPaidInvoices,
  UnpaidInvoices,
  OverdueInvoices,
  PaymentInitiated,
  PaidInvoices,
  VoidInvoices,
  WrittenOffInvoices,
}

enum OrderFilters {
  AllOrders,
  DraftOrders,
  LockedOrders,
  OrdersPendingApproval,
  ApprovedOrders,
  CustomerViewedOrders,
  PariallyPaidOrders,
  UnpaidOrders,
  OverdueOrders,
  PaymentInitiated,
  PaidOrders,
  VoidOrders,
  WrittenOffOrders,
}

enum ExpenseFilters {
  AllExpenses,
  UnbilledExpenses,
  InvoicesExpenses,
  ReimbursedExpenses,
  BillableExpenses,
  NonBillableExpenses,
  ExpensesWithReceipts,
  ExpensesWithoutReceipts,
}
