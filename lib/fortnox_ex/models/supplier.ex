defmodule FortnoxEx.Models.Supplier do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a supplier

  ## Examples

    iex> create_supplier(client, %{"Name" => "ACME")
    {:ok, %{"SupplierNumber" => "1", "Name" => "ACME"}}

    iex> create_supplier(client, supplier_attrs)
    {:error, fortnox_error}

  """
  def create_supplier(client, supplier_data) do
    Tesla.post(client, "/3/suppliers", %{"Supplier" => supplier_data})
    |> process_response("Supplier")
  end

  @doc """
  Gets a list of partial supplier objects with pagination information.

  ## Examples

    iex> list_suppliers(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"SupplierNumber" => "1", "Name" => "ACME"}]}

    iex> list_suppliers(client, [])
    {:error, fortnox_error}
  """
  def list_suppliers(client, query) do
    Tesla.get(client, "/3/suppliers", query: query)
    |> process_response("Suppliers")
  end

  @doc """
  Streams a partial supplier objects. Will go through each page of results with a delay between page.
  The stream will produce a single supplier data object for each hit.

  ## Examples

    iex> stream_suppliers(client, [])
    stream_of_suppliers

    iex> stream_suppliers(client, [])
    {:error, fortnox_error}
  """
  def stream_suppliers(client, query) do
    stream_resource(client, &list_suppliers/2, query)
  end

  @doc """
  Gets a supplier

  ## Examples

    iex> get_supplier(client, "1")
    {:ok, %{"SupplierNumber" => "1", "Name" => "Johnny", ...}

    iex> get_supplier(clientm "1")
    {:error, fortnox_error}

  """
  def get_supplier(client, supplier_number) do
    Tesla.get(client, "/3/suppliers/#{supplier_number}")
    |> process_response("Supplier")
  end

  @doc """
  Updates a supplier

  ## Examples

    iex> update_supplier(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"SupplierNumber" => "1", "Name" => "Johnny", ...}

    iex> update_supplier(clientm "1", supplier_attrs)
    {:error, fortnox_error}

  """
  def update_supplier(client, supplier_number, supplier_data) do
    Tesla.put(client, "/3/suppliers/#{supplier_number}", %{"Supplier" => supplier_data})
    |> process_response("Supplier")
  end

  @doc """
  Deletes a supplier

  ## Examples

    iex> delete_supplier(client, "1")
    :ok

    iex> delete_supplier(client, "missing")
    {:error, fortnox_error}

  """
  def delete_supplier(client, supplier_number) do
    Tesla.delete(client, "/3/suppliers/#{supplier_number}")
    |> process_response(nil)
  end
end
