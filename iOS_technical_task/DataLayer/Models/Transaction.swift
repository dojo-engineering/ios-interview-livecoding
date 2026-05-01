import Foundation

/// Represents a single payment transaction.
struct Transaction: Decodable {
    /// The unique identifier of the transaction.
    let id: UUID
    /// The monetary amount associated with the transaction.
    let amount: Amount
    /// The current processing status of the transaction.
    let status: TransactionStatus
    /// The date and time at which the transaction was created.
    let createdAt: Date
    /// The display name of the merchant involved in the transaction.
    let merchantName: String
}

/// A monetary amount expressed as a decimal value and an ISO 4217 currency code.
struct Amount: Decodable {
    /// The numeric value of the amount (e.g. `9.99`).
    let value: Decimal
    /// The ISO 4217 currency code (e.g. `"GBP"`, `"USD"`).
    let currency: String
}

/// The processing status of a transaction.
enum TransactionStatus: String, Decodable, CaseIterable {
    /// The transaction has been initiated but not yet processed.
    case pending    = "PENDING"
    /// The transaction was processed successfully.
    case completed  = "COMPLETED"
    /// The transaction was attempted but did not succeed.
    case failed     = "FAILED"
    /// The transaction amount has been returned to the customer.
    case refunded   = "REFUNDED"
}
