defmodule FortnoxEx.Models.Label do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a label

  ## Examples

    iex> create_label(client, %{"Name" => "ACME")
    {:ok, %{"CustomerNumber" => "1", "Name" => "ACME"}}

    iex> create_label(client, label_attrs)
    {:error, fortnox_error}

  """
  def create_label(client, label_data) do
    Tesla.post(client, "/3/labels", %{"Customer" => label_data})
    |> process_response("Customer")
  end

  @doc """
  Gets a list of partial label objects with pagination information.

  ## Examples

    iex> list_labels(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"CustomerNumber" => "1", "Name" => "ACME"}]}

    iex> list_labels(client, [])
    {:error, fortnox_error}
  """
  def list_labels(client, query) do
    Tesla.get(client, "/3/labels", query: query)
    |> process_response("Customers")
  end

  @doc """
  Streams a partial label objects. Will go through each page of results with a delay between page.
  The stream will produce a single label data object for each hit.

  ## Examples

    iex> stream_labels(client, [])
    stream_of_labels

    iex> stream_labels(client, [])
    {:error, fortnox_error}
  """
  def stream_labels(client, query) do
    stream_resource(client, &list_labels/2, query)
  end

  @doc """
  Gets a label

  ## Examples

    iex> get_label(client, "1")
    {:ok, %{"CustomerNumber" => "1", "Name" => "Johnny", ...}

    iex> get_label(clientm "1")
    {:error, fortnox_error}

  """
  def get_label(client, label_number) do
    Tesla.get(client, "/3/labels/#{label_number}")
    |> process_response("Customer")
  end

  @doc """
  Updates a label

  ## Examples

    iex> update_label(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"CustomerNumber" => "1", "Name" => "Johnny", ...}

    iex> update_label(clientm "1", label_attrs)
    {:error, fortnox_error}

  """
  def update_label(client, label_number, label_data) do
    Tesla.put(client, "/3/labels/#{label_number}", %{"Customer" => label_data})
    |> process_response("Customer")
  end

  @doc """
  Deletes a label

  ## Examples

    iex> delete_label(client, "1")
    :ok

    iex> delete_label(client, "missing")
    {:error, fortnox_error}

  """
  def delete_label(client, label_number) do
    Tesla.delete(client, "/3/labels/#{label_number}")
    |> process_response(nil)
  end
end
