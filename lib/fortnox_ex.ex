defmodule FortnoxEx do
  @moduledoc """
  Documentation for `FortnoxEx`.
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
