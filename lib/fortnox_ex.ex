defmodule FortnoxEx do
  @moduledoc """
  Documentation for `FortnoxEx`.

  API calls are rate limited with Fuse for 200 calls per minute. Should the rate limiting be blown, then the
  rate limiter will refresh in 60 seconds. If the fuse is blown and rate limiter is hit, then the result of any api call
  will be {:error, :unavailable}
  """

  alias FortnoxEx.Utils
  alias FortnoxEx.Models.Customer

  defdelegate get_access_token(client_secret, authorization_code), to: Utils
  defdelegate client(client_secret, access_token), to: Utils

  defdelegate create_customer(client, customer_attrs), to: Customer
  defdelegate list_customers(client, query), to: Customer
  defdelegate get_customer(client, customer_number), to: Customer
  defdelegate update_customer(client, customer_number, customer_attrs), to: Customer
  defdelegate delete_customer(client, customer_number), to: Customer
end
