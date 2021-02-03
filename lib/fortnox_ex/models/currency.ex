defmodule FortnoxEx.Models.Currency do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a currency

  ## Examples

    iex> create_currency(client, %{"Name" => "ACME")
    {:ok, %{"CurrencyNumber" => "1", "Name" => "ACME"}}

    iex> create_currency(client, currency_attrs)
    {:error, fortnox_error}

  """
  def create_currency(client, currency_data) do
    Tesla.post(client, "/3/currencies", %{"Currency" => currency_data})
    |> process_response("Currency")
  end

  @doc """
  Gets a list of partial currency objects with pagination information.

  ## Examples

    iex> list_currencies(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"CurrencyNumber" => "1", "Name" => "ACME"}]}

    iex> list_currencies(client, [])
    {:error, fortnox_error}
  """
  def list_currencies(client, query) do
    Tesla.get(client, "/3/currencies", query: query)
    |> process_response("Currencys")
  end

  @doc """
  Streams a partial currency objects. Will go through each page of results with a delay between page.
  The stream will produce a single currency data object for each hit.

  ## Examples

    iex> stream_currencies(client, [])
    stream_of_currencies

    iex> stream_currencies(client, [])
    {:error, fortnox_error}
  """
  def stream_currencies(client, query) do
    stream_resource(client, &list_currencies/2, query)
  end

  @doc """
  Gets a currency

  ## Examples

    iex> get_currency(client, "1")
    {:ok, %{"CurrencyNumber" => "1", "Name" => "Johnny", ...}

    iex> get_currency(clientm "1")
    {:error, fortnox_error}

  """
  def get_currency(client, currency_number) do
    Tesla.get(client, "/3/currencies/#{currency_number}")
    |> process_response("Currency")
  end

  @doc """
  Updates a currency

  ## Examples

    iex> update_currency(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"CurrencyNumber" => "1", "Name" => "Johnny", ...}

    iex> update_currency(clientm "1", currency_attrs)
    {:error, fortnox_error}

  """
  def update_currency(client, currency_number, currency_data) do
    Tesla.put(client, "/3/currencies/#{currency_number}", %{"Currency" => currency_data})
    |> process_response("Currency")
  end

  @doc """
  Deletes a currency

  ## Examples

    iex> delete_currency(client, "1")
    :ok

    iex> delete_currency(client, "missing")
    {:error, fortnox_error}

  """
  def delete_currency(client, currency_number) do
    Tesla.delete(client, "/3/currencies/#{currency_number}")
    |> process_response(nil)
  end
end
