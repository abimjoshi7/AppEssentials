enum ItemSorts {
  Name,
  Rate,
  PurchaseRate,
  StockOnHand,
  LastModifiedTime;
}

enum ItemTxnInvoiceSorts {
  CreatedTime,
  Date,
  InvoiceNumber,
  BillNumber,
  OrderNumber,
  VendorName,
  CustomerName,
  DueDate,
  Amount,
  BalanceDue,
  LastModifiedTime,
}

enum ItemTxnRecurInvoiceSorts {
  CreatedTime,
  LastModifiedTime,
  CustomerName,
  ProfileName,
  LastInvoiceDate,
  NextInvoiceDate,
  Amount,
}

enum CustomerSorts {
  Name,
  CompanyName,
  Receivables,
  CreatedTime,
  LastModifiedTime;
}

enum CustomerPaymentSorts {
  CreateTime,
  LastModifiedTime,
  Date,
  PaymentNumber,
  CustomerName,
  Mode,
  Amount,
  UnusedAmount,
}

enum CustomerExpenseSorts {
  CreatedTime,
  Date,
  ExpenseAccount,
  VendorName,
  PaidThrough,
  CustomerName,
  Amount,
}

enum CustomerProjectSorts {
  CustomerName,
  ProjectName,
  Rate,
}

enum CustomerJournalSorts {
  Date,
  JournalNumber,
  ReferenceNumber,
}

enum ExpenseSorts {
  CreatedTime,
  Date,
  ExpenseAccount,
  VendorName,
  PaidThrough,
  CustomerName,
  Amount,
}
