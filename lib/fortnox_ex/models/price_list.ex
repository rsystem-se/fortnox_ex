defmodule FortnoxEx.Models.PriceList do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a price_list

  ## Examples

    iex> create_price_list(client, %{"Name" => "ACME")
    {:ok, %{"PriceListNumber" => "1", "Name" => "ACME"}}

    iex> create_price_list(client, price_list_attrs)
    {:error, fortnox_error}

  """
  def create_price_list(client, price_list_data) do
    Tesla.post(client, "/3/pricelists", %{"PriceList" => price_list_data})
    |> process_response("PriceList")
  end

  @doc """
  Gets a list of partial price_list objects with pagination information.

  ## Examples

    iex> list_price_lists(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"PriceListNumber" => "1", "Name" => "ACME"}]}

    iex> list_price_lists(client, [])
    {:error, fortnox_error}
  """
  def list_price_lists(client, query) do
    Tesla.get(client, "/3/pricelists", query: query)
    |> process_response("PriceLists")
  end

  @doc """
  Streams a partial price_list objects. Will go through each page of results with a delay between page.
  The stream will produce a single price_list data object for each hit.

  ## Examples

    iex> stream_price_lists(client, [])
    stream_of_price_lists

    iex> stream_price_lists(client, [])
    {:error, fortnox_error}
  """
  def stream_price_lists(client, query) do
    stream_resource(client, &list_price_lists/2, query)
  end

  @doc """
  Gets a price_list

  ## Examples

    iex> get_price_list(client, "1")
    {:ok, %{"PriceListNumber" => "1", "Name" => "Johnny", ...}

    iex> get_price_list(clientm "1")
    {:error, fortnox_error}

  """
  def get_price_list(client, price_list_number) do
    Tesla.get(client, "/3/pricelists/#{price_list_number}")
    |> process_response("PriceList")
  end

  @doc """
  Updates a price_list

  ## Examples

    iex> update_price_list(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"PriceListNumber" => "1", "Name" => "Johnny", ...}

    iex> update_price_list(clientm "1", price_list_attrs)
    {:error, fortnox_error}

  """
  def update_price_list(client, price_list_number, price_list_data) do
    Tesla.put(client, "/3/pricelists/#{price_list_number}", %{"PriceList" => price_list_data})
    |> process_response("PriceList")
  end

  @doc """
  Deletes a price_list

  ## Examples

    iex> delete_price_list(client, "1")
    :ok

    iex> delete_price_list(client, "missing")
    {:error, fortnox_error}

  """
  def delete_price_list(client, price_list_number) do
    Tesla.delete(client, "/3/pricelists/#{price_list_number}")
    |> process_response(nil)
  end
end
