# FortnoxEx

API Client for Fortnox. For more details about Fortnox API, please see
[https://developer.fortnox.se/documentation/](https://developer.fortnox.se/documentation/)

The documentation for FortnoxEx can be found at
[https://hexdocs.pm/fortnox_ex](https://hexdocs.pm/fortnox_ex)

## Stability and Quality of this library

Not used in production. Untested to most degree. Help wanted. Rate limiting is tested. Use with caution.

## Models

* Absence Transaction
* Account
* Articles
* Asset (actions not implemented)
* Attendance Transaction
* Contract
* Customer
* Employee
* Invoice (actions not implemented)
* Offer (actions not implemented)
* Order (actions not implemented)
* Project (actions not implemented)
* Supplier
* Supplier Invoice
* Unit

**NOT SUPPORTED YET - HELP WANTED**
* Account Chart
* Archive
* Article File Connection
* Asset Type
* Company Information
* Company Setting
* Contract Accrual
* Contract Template
* Cost Center
* Currency
* Digital Receipt
* Expense
* Financial Year
* Inbox
* Invoice Accrual
* Invoice File Connection
* Invoice Payment
* Label
* Locked Period
* Mode of Payment
* Nox Finans Invoice
* Predefined Account
* Predefined Voucher Serie
* Price List
* Print Template
* Salary Transaction
* Schedule Time
* SIE
* Supplier Invoice Accrual
* Supplier Invoice External URL Connection
* Supplier Invoice File Connection
* Supplier Invoice Payment
* Tax Reduction
* Term of Delivery
* Term of Payment
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
    {:fortnox_ex, "~> 0.2.0"}
  ]
end
```
