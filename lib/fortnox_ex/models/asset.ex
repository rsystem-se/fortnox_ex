defmodule FortnoxEx.Models.Asset do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a asset

  ## Examples

    iex> create_asset(client, %{"Name" => "ACME")
    {:ok, %{"AssetNumber" => "1", "Name" => "ACME"}}

    iex> create_asset(client, asset_attrs)
    {:error, fortnox_error}

  """
  def create_asset(client, asset_data) do
    Tesla.post(client, "/3/assets", %{"Asset" => asset_data})
    |> process_response("Asset")
  end

  @doc """
  Gets a list of partial asset objects with pagination information.

  ## Examples

    iex> list_assets(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"AssetNumber" => "1", "Name" => "ACME"}]}

    iex> list_assets(client, [])
    {:error, fortnox_error}
  """
  def list_assets(client, query) do
    Tesla.get(client, "/3/assets", query: query)
    |> process_response("Assets")
  end

  @doc """
  Streams a partial asset objects. Will go through each page of results with a delay between page.
  The stream will produce a single asset data object for each hit.

  ## Examples

    iex> stream_assets(client, [])
    stream_of_assets

    iex> stream_assets(client, [])
    {:error, fortnox_error}
  """
  def stream_assets(client, query) do
    stream_resource(client, &list_assets/2, query)
  end

  @doc """
  Gets a asset

  ## Examples

    iex> get_asset(client, "1")
    {:ok, %{"AssetNumber" => "1", "Name" => "Johnny", ...}

    iex> get_asset(clientm "1")
    {:error, fortnox_error}

  """
  def get_asset(client, asset_number) do
    Tesla.get(client, "/3/assets/#{asset_number}")
    |> process_response("Asset")
  end

  @doc """
  Updates a asset

  ## Examples

    iex> update_asset(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"AssetNumber" => "1", "Name" => "Johnny", ...}

    iex> update_asset(clientm "1", asset_attrs)
    {:error, fortnox_error}

  """
  def update_asset(client, asset_number, asset_data) do
    Tesla.put(client, "/3/assets/#{asset_number}", %{"Asset" => asset_data})
    |> process_response("Asset")
  end

  @doc """
  Deletes a asset

  ## Examples

    iex> delete_asset(client, "1")
    :ok

    iex> delete_asset(client, "missing")
    {:error, fortnox_error}

  """
  def delete_asset(client, asset_number) do
    Tesla.delete(client, "/3/assets/#{asset_number}")
    |> process_response(nil)
  end
end
