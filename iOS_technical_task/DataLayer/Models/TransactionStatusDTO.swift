import Foundation

/// The processing status of a transaction.
enum TransactionStatusDTO: String, Decodable, CaseIterable {
    /// The transaction has been initiated but not yet processed.
    case pending    = "PENDING"
    /// The transaction was processed successfully.
    case completed  = "COMPLETED"
    /// The transaction was attempted but did not succeed.
    case failed     = "FAILED"
    /// The transaction amount has been returned to the customer.
    case refunded   = "REFUNDED"
}
