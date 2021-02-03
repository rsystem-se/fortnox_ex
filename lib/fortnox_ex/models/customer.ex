defmodule FortnoxEx.Models.Customer do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a customer

  ## Examples

    iex> create_customer(client, %{"Name" => "ACME")
    {:ok, %{"CustomerNumber" => "1", "Name" => "ACME"}}

    iex> create_customer(client, customer_attrs)
    {:error, fortnox_error}

  """
  def create_customer(client, customer_data) do
    Tesla.post(client, "/3/customers", %{"Customer" => customer_data})
    |> process_response("Customer")
  end

  @doc """
  Gets a list of partial customer objects with pagination information.

  ## Examples

    iex> list_customers(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"CustomerNumber" => "1", "Name" => "ACME"}]}

    iex> list_customers(client, [])
    {:error, fortnox_error}
  """
  def list_customers(client, query) do
    Tesla.get(client, "/3/customers", query: query)
    |> process_response("Customers")
  end

  @doc """
  Streams a partial customer objects. Will go through each page of results with a delay between page.
  The stream will produce a single customer data object for each hit.

  ## Examples

    iex> stream_customers(client, [])
    stream_of_customers

    iex> stream_customers(client, [])
    {:error, fortnox_error}
  """
  def stream_customers(client, query) do
    stream_resource(client, &list_customers/2, query)
  end

  @doc """
  Gets a customer

  ## Examples

    iex> get_customer(client, "1")
    {:ok, %{"CustomerNumber" => "1", "Name" => "Johnny", ...}

    iex> get_customer(clientm "1")
    {:error, fortnox_error}

  """
  def get_customer(client, customer_number) do
    Tesla.get(client, "/3/customers/#{customer_number}")
    |> process_response("Customer")
  end

  @doc """
  Updates a customer

  ## Examples

    iex> update_customer(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"CustomerNumber" => "1", "Name" => "Johnny", ...}

    iex> update_customer(clientm "1", customer_attrs)
    {:error, fortnox_error}

  """
  def update_customer(client, customer_number, customer_data) do
    Tesla.put(client, "/3/customers/#{customer_number}", %{"Customer" => customer_data})
    |> process_response("Customer")
  end

  @doc """
  Deletes a customer

  ## Examples

    iex> delete_customer(client, "1")
    :ok

    iex> delete_customer(client, "missing")
    {:error, fortnox_error}

  """
  def delete_customer(client, customer_number) do
    Tesla.delete(client, "/3/customers/#{customer_number}")
    |> process_response(nil)
  end
end
