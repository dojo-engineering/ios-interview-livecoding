import Foundation

/// Represents a single payment transaction.
struct TransactionDTO: Decodable {
    /// The unique identifier of the transaction.
    let id: UUID
    /// The monetary amount associated with the transaction.
    let amount: AmountDTO
    /// The current processing status of the transaction.
    let status: TransactionStatusDTO
    /// The date and time at which the transaction was created.
    let createdAt: Date
    /// The display name of the merchant involved in the transaction.
    let merchantName: String
}
