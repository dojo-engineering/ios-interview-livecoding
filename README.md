# iOS Live Coding Task

Welcome! This is a collaborative session — we're not looking for perfection, we're interested in how you think, how you structure your code, and how you communicate decisions as you go.

Feel free to **think out loud**, ask questions, and discuss trade-offs as you work. There are no trick questions.

---

## Prerequisites

- Xcode 26 or later
- iOS 26+ deployment target
- No third-party dependencies — the project builds out of the box
- **No AI**: Please refrain from using any AI tools/agents to help you with this task.

---

## Context

The project contains a basic data layer and a stubbed-out `TransactionListScreen`. The `NetworkClient` currently simulates a network call by resolving pre-populated mock data with an artificial 500 ms delay.

### Project structure

```
iOS_technical_task/
├── DataLayer/
│   ├── Models/
│   │   └── Transaction.swift       — Transaction, Amount, TransactionStatus
│   └── TransactionsEndpoint.swift  — Mock endpoints + Endpoint<T> type
├── Networking/
│   └── NetworkClient.swift         — Async GET helper
└── PresentationLayer/
    └── TransactionListScreen/
        └── TransactionListScreen.swift   — Your starting point
```

### Data model

| Field | Type | Description |
|---|---|---|
| `id` | `UUID` | Unique transaction identifier |
| `amount.value` | `Decimal` | Monetary value (can be negative for refunds) |
| `amount.currency` | `String` | ISO 4217 currency code, e.g. `"GBP"` |
| `status` | `TransactionStatus` | `PENDING` · `COMPLETED` · `FAILED` · `REFUNDED` |
| `createdAt` | `Date` | Creation timestamp |
| `merchantName` | `String` | Display name of the merchant |

---

## Tasks

### 1. Display a list of transactions

Fetch the transaction list using `NetworkClient` and display it in `TransactionListScreen`.

Each row should show, at minimum:
- Merchant name
- Formatted amount (with currency symbol)
- Transaction status

**Things to consider:**
- How do you manage loading, success, and error states?
- How do you keep the view layer decoupled from the data layer?

---

### 2. Search

Add a search bar that lets the user filter the transaction list by merchant name.

Implement this as **local (client-side) filtering** for now, but be ready to discuss how you would approach it with a real backend.

---

### 3. Navigate to a transaction detail screen

Tapping a row should push a detail screen that displays all the information for that transaction.

---

## Guidelines

- Use **SwiftUI** and **Swift Concurrency** (`async/await`)
- No third-party dependencies needed
- There's no single right answer — we value clear reasoning over completeness
- Feel free to refactor any existing code if you think it improves the solution
