# FortnoxEx

API Client for Fortnox. For more details about Fortnox API, please see
[https://developer.fortnox.se/documentation/](https://developer.fortnox.se/documentation/)

The documentation for FortnoxEx can be found at
[https://hexdocs.pm/fortnox_ex](https://hexdocs.pm/fortnox_ex)

## Stability and Quality of this library

Not used in production. Untested to most degree. Help wanted. Rate limiting is tested. Use with caution.

## Models

* Articles
* AttendanceTransaction
* Contract
* Customer
* Employee
* Invoice (actions not implemented)
* Offer (actions not implemented)
* Order (actions not implemented)
* Project (actions not implemented)

## Features for all models

* Create
* List
* Stream (all pages for paginated list results)
* Update
* Delete

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fortnox_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fortnox_ex, "~> 0.1.0"}
  ]
end
```
