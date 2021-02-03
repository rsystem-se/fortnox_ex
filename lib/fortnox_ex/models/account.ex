defmodule FortnoxEx.Models.Account do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a account

  ## Examples

    iex> create_account(client, %{"Name" => "ACME")
    {:ok, %{"AccountNumber" => "1", "Name" => "ACME"}}

    iex> create_account(client, account_attrs)
    {:error, fortnox_error}

  """
  def create_account(client, account_data) do
    Tesla.post(client, "/3/accounts", %{"Account" => account_data})
    |> process_response("Account")
  end

  @doc """
  Gets a list of partial account objects with pagination information.

  ## Examples

    iex> list_accounts(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"AccountNumber" => "1", "Name" => "ACME"}]}

    iex> list_accounts(client, [])
    {:error, fortnox_error}
  """
  def list_accounts(client, query) do
    Tesla.get(client, "/3/accounts", query: query)
    |> process_response("Accounts")
  end

  @doc """
  Streams a partial account objects. Will go through each page of results with a delay between page.
  The stream will produce a single account data object for each hit.

  ## Examples

    iex> stream_accounts(client, [])
    stream_of_accounts

    iex> stream_accounts(client, [])
    {:error, fortnox_error}
  """
  def stream_accounts(client, query) do
    stream_resource(client, &list_accounts/2, query)
  end

  @doc """
  Gets a account

  ## Examples

    iex> get_account(client, "1")
    {:ok, %{"AccountNumber" => "1", "Name" => "Johnny", ...}

    iex> get_account(clientm "1")
    {:error, fortnox_error}

  """
  def get_account(client, account_number) do
    Tesla.get(client, "/3/accounts/#{account_number}")
    |> process_response("Account")
  end

  @doc """
  Updates a account

  ## Examples

    iex> update_account(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"AccountNumber" => "1", "Name" => "Johnny", ...}

    iex> update_account(clientm "1", account_attrs)
    {:error, fortnox_error}

  """
  def update_account(client, account_number, account_data) do
    Tesla.put(client, "/3/accounts/#{account_number}", %{"Account" => account_data})
    |> process_response("Account")
  end

  @doc """
  Deletes a account

  ## Examples

    iex> delete_account(client, "1")
    :ok

    iex> delete_account(client, "missing")
    {:error, fortnox_error}

  """
  def delete_account(client, account_number) do
    Tesla.delete(client, "/3/accounts/#{account_number}")
    |> process_response(nil)
  end
end
