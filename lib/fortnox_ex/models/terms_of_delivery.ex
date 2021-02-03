defmodule FortnoxEx.Models.TermsOfDelivery do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a terms_of_delivery

  ## Examples

    iex> create_terms_of_delivery(client, %{"Name" => "ACME")
    {:ok, %{"TermsOfDeliveryNumber" => "1", "Name" => "ACME"}}

    iex> create_terms_of_delivery(client, terms_of_delivery_attrs)
    {:error, fortnox_error}

  """
  def create_terms_of_delivery(client, terms_of_delivery_data) do
    Tesla.post(client, "/3/termsofdeliverys", %{"TermsOfDelivery" => terms_of_delivery_data})
    |> process_response("TermsOfDelivery")
  end

  @doc """
  Gets a list of partial terms_of_delivery objects with pagination information.

  ## Examples

    iex> list_terms_of_deliverys(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"TermsOfDeliveryNumber" => "1", "Name" => "ACME"}]}

    iex> list_terms_of_deliverys(client, [])
    {:error, fortnox_error}
  """
  def list_terms_of_deliverys(client, query) do
    Tesla.get(client, "/3/termsofdeliverys", query: query)
    |> process_response("TermsOfDeliverys")
  end

  @doc """
  Streams a partial terms_of_delivery objects. Will go through each page of results with a delay between page.
  The stream will produce a single terms_of_delivery data object for each hit.

  ## Examples

    iex> stream_terms_of_deliverys(client, [])
    stream_of_terms_of_deliverys

    iex> stream_terms_of_deliverys(client, [])
    {:error, fortnox_error}
  """
  def stream_terms_of_deliverys(client, query) do
    stream_resource(client, &list_terms_of_deliverys/2, query)
  end

  @doc """
  Gets a terms_of_delivery

  ## Examples

    iex> get_terms_of_delivery(client, "1")
    {:ok, %{"TermsOfDeliveryNumber" => "1", "Name" => "Johnny", ...}

    iex> get_terms_of_delivery(clientm "1")
    {:error, fortnox_error}

  """
  def get_terms_of_delivery(client, terms_of_delivery_code) do
    Tesla.get(client, "/3/termsofdeliverys/#{terms_of_delivery_code}")
    |> process_response("TermsOfDelivery")
  end

  @doc """
  Updates a terms_of_delivery

  ## Examples

    iex> update_terms_of_delivery(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"TermsOfDeliveryNumber" => "1", "Name" => "Johnny", ...}

    iex> update_terms_of_delivery(clientm "1", terms_of_delivery_attrs)
    {:error, fortnox_error}

  """
  def update_terms_of_delivery(client, terms_of_delivery_code, terms_of_delivery_data) do
    Tesla.put(client, "/3/termsofdeliverys/#{terms_of_delivery_code}", %{"TermsOfDelivery" => terms_of_delivery_data})
    |> process_response("TermsOfDelivery")
  end

  @doc """
  Deletes a supplier_invoice

  ## Examples

    iex> delete_supplier_invoice(client, "1")
    :ok

    iex> delete_supplier_invoice(client, "missing")
    {:error, fortnox_error}

  """
  def delete_terms_of_delivery(client, terms_of_delivery_code) do
    Tesla.delete(client, "/3/termsofdeliverys/#{terms_of_delivery_code}")
    |> process_response(nil)
  end
end
