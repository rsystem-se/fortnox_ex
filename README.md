# FortnoxEx

Unofficial API Client for Fortnox. For more details about Fortnox API, please see
[https://developer.fortnox.se/documentation/](https://developer.fortnox.se/documentation/)

The documentation for FortnoxEx can be found at
[https://hexdocs.pm/fortnox_ex](https://hexdocs.pm/fortnox_ex)

## Stability and Quality of this library

Not used in production. Untested to most degree. Help wanted. Rate limiting is tested. Use with caution.

## Models

* Absence Transaction
* Account
* Account Chart
* Articles
* Asset (actions not implemented)
* Attendance Transaction
* Contract
* Currency
* Customer
* Employee
* Expense
* Invoice (actions not implemented)
* Invoice Payment (actions not implemented)
* Label
* Modes of Payment
* Offer (actions not implemented)
* Order (actions not implemented)
* Price List
* Print Template
* Project (actions not implemented)
* Supplier
* Supplier Invoice
* Terms of Delivery
* Terms of Payment
* Unit

**NOT SUPPORTED YET - HELP WANTED**
* Archive
* Article File Connection
* Asset Type
* Company Information
* Company Setting
* Contract Accrual
* Contract Template
* Cost Center
* Digital Receipt
* Financial Year
* Inbox
* Invoice Accrual
* Invoice File Connection
* Locked Period
* Nox Finans Invoice
* Predefined Account
* Predefined Voucher Serie
* Salary Transaction
* Schedule Time
* SIE
* Supplier Invoice Accrual
* Supplier Invoice External URL Connection
* Supplier Invoice File Connection
* Supplier Invoice Payment
* Tax Reduction
* Trusted Email Domain
* Trusted Email Sender
* Voucher File Connection
* Voucher Serie
* Voucher
* Warehouse Custom Inbound Document
* Warehouse Custom Outbound Document
* Warehouse Information
* Warehouse Item Summary
* Warehouse Resource Specific Field
* Way of Delivery

## Features

* Create
* List
* Stream (all pages for paginated list results)
* Update
* Delete
* Actions

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fortnox_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fortnox_ex, "~> 0.3.0"}
  ]
end
```

# Contributors

* Nils Ivanson
