defmodule FortnoxEx.Models.Unit do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a unit

  ## Examples

    iex> create_unit(client, %{"Name" => "ACME")
    {:ok, %{"UnitNumber" => "1", "Name" => "ACME"}}

    iex> create_unit(client, unit_attrs)
    {:error, fortnox_error}

  """
  def create_unit(client, unit_data) do
    Tesla.post(client, "/3/units", %{"Unit" => unit_data})
    |> process_response("Unit")
  end

  @doc """
  Gets a list of partial unit objects with pagination information.

  ## Examples

    iex> list_units(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"UnitNumber" => "1", "Name" => "ACME"}]}

    iex> list_units(client, [])
    {:error, fortnox_error}
  """
  def list_units(client, query) do
    Tesla.get(client, "/3/units", query: query)
    |> process_response("Units")
  end

  @doc """
  Streams a partial unit objects. Will go through each page of results with a delay between page.
  The stream will produce a single unit data object for each hit.

  ## Examples

    iex> stream_units(client, [])
    stream_of_units

    iex> stream_units(client, [])
    {:error, fortnox_error}
  """
  def stream_units(client, query) do
    stream_resource(client, &list_units/2, query)
  end

  @doc """
  Gets a unit

  ## Examples

    iex> get_unit(client, "1")
    {:ok, %{"UnitNumber" => "1", "Name" => "Johnny", ...}

    iex> get_unit(clientm "1")
    {:error, fortnox_error}

  """
  def get_unit(client, unit_number) do
    Tesla.get(client, "/3/units/#{unit_number}")
    |> process_response("Unit")
  end

  @doc """
  Updates a unit

  ## Examples

    iex> update_unit(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"UnitNumber" => "1", "Name" => "Johnny", ...}

    iex> update_unit(clientm "1", unit_attrs)
    {:error, fortnox_error}

  """
  def update_unit(client, unit_number, unit_data) do
    Tesla.put(client, "/3/units/#{unit_number}", %{"Unit" => unit_data})
    |> process_response("Unit")
  end

  @doc """
  Deletes a unit

  ## Examples

    iex> delete_unit(client, "1")
    :ok

    iex> delete_unit(client, "missing")
    {:error, fortnox_error}

  """
  def delete_unit(client, unit_number) do
    Tesla.delete(client, "/3/units/#{unit_number}")
    |> process_response(nil)
  end
end
