defmodule FortnoxEx.Models.WayOfDelivery do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a way_of_delivery

  ## Examples

    iex> create_way_of_delivery(client, %{"Name" => "ACME")
    {:ok, %{"WayOfDeliveryNumber" => "1", "Name" => "ACME"}}

    iex> create_way_of_delivery(client, way_of_delivery_attrs)
    {:error, fortnox_error}

  """
  def create_way_of_delivery(client, way_of_delivery_data) do
    Tesla.post(client, "/3/wayofdeliveries", %{"WayOfDelivery" => way_of_delivery_data})
    |> process_response("WayOfDelivery")
  end

  @doc """
  Gets a list of partial way_of_delivery objects with pagination information.

  ## Examples

    iex> list_way_of_deliverys(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"WayOfDeliveryNumber" => "1", "Name" => "ACME"}]}

    iex> list_way_of_deliverys(client, [])
    {:error, fortnox_error}
  """
  def list_way_of_deliverys(client, query) do
    Tesla.get(client, "/3/wayofdeliveries", query: query)
    |> process_response("WayOfDeliverys")
  end

  @doc """
  Streams a partial way_of_delivery objects. Will go through each page of results with a delay between page.
  The stream will produce a single way_of_delivery data object for each hit.

  ## Examples

    iex> stream_way_of_deliverys(client, [])
    stream_of_way_of_deliverys

    iex> stream_way_of_deliverys(client, [])
    {:error, fortnox_error}
  """
  def stream_way_of_deliverys(client, query) do
    stream_resource(client, &list_way_of_deliverys/2, query)
  end

  @doc """
  Gets a way_of_delivery

  ## Examples

    iex> get_way_of_delivery(client, "1")
    {:ok, %{"WayOfDeliveryNumber" => "1", "Name" => "Johnny", ...}

    iex> get_way_of_delivery(clientm "1")
    {:error, fortnox_error}

  """
  def get_way_of_delivery(client, way_of_delivery_code) do
    Tesla.get(client, "/3/wayofdeliveries/#{way_of_delivery_code}")
    |> process_response("WayOfDelivery")
  end

  @doc """
  Updates a way_of_delivery

  ## Examples

    iex> update_way_of_delivery(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"WayOfDeliveryNumber" => "1", "Name" => "Johnny", ...}

    iex> update_way_of_delivery(clientm "1", way_of_delivery_attrs)
    {:error, fortnox_error}

  """
  def update_way_of_delivery(client, way_of_delivery_code, way_of_delivery_data) do
    Tesla.put(client, "/3/wayofdeliveries/#{way_of_delivery_code}", %{"WayOfDelivery" => way_of_delivery_data})
    |> process_response("WayOfDelivery")
  end

  @doc """
  Deletes a supplier_invoice

  ## Examples

    iex> delete_supplier_invoice(client, "1")
    :ok

    iex> delete_supplier_invoice(client, "missing")
    {:error, fortnox_error}

  """
  def delete_way_of_delivery(client, way_of_delivery_code) do
    Tesla.delete(client, "/3/wayofdeliveries/#{way_of_delivery_code}")
    |> process_response(nil)
  end
end
