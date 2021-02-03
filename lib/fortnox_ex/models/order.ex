defmodule FortnoxEx.Models.Order do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a order

  ## Examples

    iex> create_order(client, %{"Name" => "ACME")
    {:ok, %{"DocumentNumber" => "1", "Name" => "ACME"}}

    iex> create_order(client, order_attrs)
    {:error, fortnox_error}

  """
  def create_order(client, order_data) do
    Tesla.post(client, "/3/orders", %{"Order" => order_data})
    |> process_response("Order")
  end

  @doc """
  Gets a list of partial order objects with pagination information.

  ## Examples

    iex> list_orders(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"DocumentNumber" => "1", "Name" => "ACME"}]}

    iex> list_orders(client, [])
    {:error, fortnox_error}
  """
  def list_orders(client, query) do
    Tesla.get(client, "/3/orders", query: query)
    |> process_response("Orders")
  end

  @doc """
  Streams a partial order objects. Will go through each page of results with a delay between page.
  The stream will produce a single order data object for each hit.

  ## Examples

    iex> stream_orders(client, [])
    stream_of_orders

    iex> stream_orders(client, [])
    {:error, fortnox_error}
  """
  def stream_orders(client, query) do
    stream_resource(client, &list_orders/2, query)
  end

  @doc """
  Gets a order

  ## Examples

    iex> get_order(client, "1")
    {:ok, %{"DocumentNumber" => "1", "Name" => "Johnny", ...}

    iex> get_order(clientm "1")
    {:error, fortnox_error}

  """
  def get_order(client, order_number) do
    Tesla.get(client, "/3/orders/#{order_number}")
    |> process_response("Order")
  end

  @doc """
  Updates a order

  ## Examples

    iex> update_order(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"DocumentNumber" => "1", "Name" => "Johnny", ...}

    iex> update_order(clientm "1", order_attrs)
    {:error, fortnox_error}

  """
  def update_order(client, order_number, order_data) do
    Tesla.put(client, "/3/orders/#{order_number}", %{"Order" => order_data})
    |> process_response("Order")
  end

  @doc """
  Deletes a order

  ## Examples

    iex> delete_order(client, "1")
    :ok

    iex> delete_order(client, "missing")
    {:error, fortnox_error}

  """
  def delete_order(client, order_number) do
    Tesla.delete(client, "/3/orders/#{order_number}")
    |> process_response(nil)
  end
end
