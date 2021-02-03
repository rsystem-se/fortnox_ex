defmodule FortnoxEx.Models.Offer do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a offer

  ## Examples

    iex> create_offer(client, %{"Name" => "ACME")
    {:ok, %{"DocumentNumber" => "1", "Name" => "ACME"}}

    iex> create_offer(client, offer_attrs)
    {:error, fortnox_error}

  """
  def create_offer(client, offer_data) do
    Tesla.post(client, "/3/offers", %{"Offer" => offer_data})
    |> process_response("Offer")
  end

  @doc """
  Gets a list of partial offer objects with pagination information.

  ## Examples

    iex> list_offers(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"DocumentNumber" => "1", "Name" => "ACME"}]}

    iex> list_offers(client, [])
    {:error, fortnox_error}
  """
  def list_offers(client, query) do
    Tesla.get(client, "/3/offers", query: query)
    |> process_response("Offers")
  end

  @doc """
  Streams a partial offer objects. Will go through each page of results with a delay between page.
  The stream will produce a single offer data object for each hit.

  ## Examples

    iex> stream_offers(client, [])
    stream_of_offers

    iex> stream_offers(client, [])
    {:error, fortnox_error}
  """
  def stream_offers(client, query) do
    stream_resource(client, &list_offers/2, query)
  end

  @doc """
  Gets a offer

  ## Examples

    iex> get_offer(client, "1")
    {:ok, %{"DocumentNumber" => "1", "Name" => "Johnny", ...}

    iex> get_offer(clientm "1")
    {:error, fortnox_error}

  """
  def get_offer(client, offer_number) do
    Tesla.get(client, "/3/offers/#{offer_number}")
    |> process_response("Offer")
  end

  @doc """
  Updates a offer

  ## Examples

    iex> update_offer(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"DocumentNumber" => "1", "Name" => "Johnny", ...}

    iex> update_offer(clientm "1", offer_attrs)
    {:error, fortnox_error}

  """
  def update_offer(client, offer_number, offer_data) do
    Tesla.put(client, "/3/offers/#{offer_number}", %{"Offer" => offer_data})
    |> process_response("Offer")
  end

  @doc """
  Deletes a offer

  ## Examples

    iex> delete_offer(client, "1")
    :ok

    iex> delete_offer(client, "missing")
    {:error, fortnox_error}

  """
  def delete_offer(client, offer_number) do
    Tesla.delete(client, "/3/offers/#{offer_number}")
    |> process_response(nil)
  end
end
