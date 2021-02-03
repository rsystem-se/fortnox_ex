# FortnoxEx

Unofficial API Client for Fortnox. For more details about Fortnox API, please see
[https://developer.fortnox.se/documentation/](https://developer.fortnox.se/documentation/)

Built from Unofficial OpenAPI Specification at
[https://github.com/rsystem-se/fortnox_openapi](https://github.com/rsystem-se/fortnox_openapi)

The documentation for FortnoxEx can be found at
[https://hexdocs.pm/fortnox_ex](https://hexdocs.pm/fortnox_ex)

### Missing or incorrect features

Please see the specification at https://github.com/rsystem-se/fortnox_openapi before opening any issues in this repository.

### Stability and Quality of this library

Not used in production. Untested to most degree. Help wanted. Rate limiting is tested. Use with caution.

### Building

To install the required dependencies and to build the elixir project, run:
```
mix local.hex --force
mix do deps.get, compile
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fortnox_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:fortnox_ex, "~> 0.4.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/fortnox_ex](https://hexdocs.pm/fortnox_ex).
