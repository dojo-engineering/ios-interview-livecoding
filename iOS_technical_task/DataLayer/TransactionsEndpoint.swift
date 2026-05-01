import Foundation

/// Errors that can be thrown when working with transaction data.
enum TransactionError: Error {
    /// No transaction was found matching the requested identifier.
    case notFound
}

/// A generic, type-safe container for an API endpoint response.
///
/// `Endpoint` wraps a `Result` value so that the data layer can return either
/// a successfully decoded model or a typed error in a uniform way.
///
/// - Note: In this project the endpoint uses mock data. In a real implementation
///   this would encapsulate URL construction and the network call itself.
///
/// ```swift
/// let endpoint = Endpoint<[Transaction]>.transactions
/// switch endpoint.result {
/// case .success(let list): // use list
/// case .failure(let error): // handle error
/// }
/// ```
struct Endpoint<D: Decodable> {
    /// The result of the endpoint call — either a successfully decoded value or an error.
    let result: Result<D, Error>
}

// MARK: - Transaction Endpoints

extension Endpoint where D == [Transaction] {

    /// Returns an endpoint whose result contains the full mock list of transactions.
    ///
    /// `GET /v1/transactions`  *(mock)*
    static var transactions = Endpoint(result: .success(Transaction.mockList))

    /// Returns an endpoint whose result contains a single transaction matching `id`,
    /// or a `.failure(TransactionError.notFound)` if no match exists.
    ///
    /// `GET /v1/transactions/{id}`  *(mock)*
    ///
    /// - Parameter id: The `UUID` of the transaction to look up.
    static func transaction(id: UUID) -> Endpoint<Transaction> {
        guard let transaction = Transaction.mockList.first(where: { $0.id == id }) else {
            return .init(result: .failure(TransactionError.notFound))
        }
        return .init(result: .success(transaction))
    }
}

// MARK: - Mock Helpers

extension Transaction {

    /// Creates a single `Transaction` with randomised field values, useful for
    /// populating previews and the mock data set.
    static func mock() -> Self {
        .init(
            id: .init(),
            amount: .init(
                value: Decimal(Double.random(in: -9999...9999)),
                currency: "GBP"
            ),
            status: TransactionStatus.allCases.randomElement() ?? .completed,
            createdAt: Date.randomInPast(days: 30),
            merchantName: ["Dojo", "Acme", "Foo Bar"].randomElement() ?? "Dojo"
        )
    }

    /// A pre-generated list of 100 mock transactions, shared across the app
    /// so that list and detail screens reference the same data.
    static let mockList: [Self] = (0..<100).map { _ in .mock() }
}

extension Date {

    /// Returns a random `Date` within the last `days` days from now.
    ///
    /// - Parameter days: The maximum number of days in the past to generate a date for.
    static func randomInPast(days: Int) -> Date {
        let secondsInDay = 86_400
        let randomSeconds = Int.random(in: 0...(days * secondsInDay))
        return Date().addingTimeInterval(TimeInterval(-randomSeconds))
    }
}
