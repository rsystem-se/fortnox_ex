defmodule FortnoxEx.Models.Invoice do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a invoice

  ## Examples

    iex> create_invoice(client, %{"Name" => "ACME")
    {:ok, %{"DocumentNumber" => "1", "Name" => "ACME"}}

    iex> create_invoice(client, invoice_attrs)
    {:error, fortnox_error}

  """
  def create_invoice(client, invoice_data) do
    Tesla.post(client, "/3/invoices", %{"Invoice" => invoice_data})
    |> process_response("Invoice")
  end

  @doc """
  Gets a list of partial invoice objects with pagination information.

  ## Examples

    iex> list_invoices(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"DocumentNumber" => "1", "Name" => "ACME"}]}

    iex> list_invoices(client, [])
    {:error, fortnox_error}
  """
  def list_invoices(client, query) do
    Tesla.get(client, "/3/invoices", query: query)
    |> process_response("Invoices")
  end

  @doc """
  Streams a partial invoice objects. Will go through each page of results with a delay between page.
  The stream will produce a single invoice data object for each hit.

  ## Examples

    iex> stream_invoices(client, [])
    stream_of_invoices

    iex> stream_invoices(client, [])
    {:error, fortnox_error}
  """
  def stream_invoices(client, query) do
    stream_resource(client, &list_invoices/2, query)
  end

  @doc """
  Gets a invoice

  ## Examples

    iex> get_invoice(client, "1")
    {:ok, %{"DocumentNumber" => "1", "Name" => "Johnny", ...}

    iex> get_invoice(clientm "1")
    {:error, fortnox_error}

  """
  def get_invoice(client, invoice_number) do
    Tesla.get(client, "/3/invoices/#{invoice_number}")
    |> process_response("Invoice")
  end

  @doc """
  Updates a invoice

  ## Examples

    iex> update_invoice(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"DocumentNumber" => "1", "Name" => "Johnny", ...}

    iex> update_invoice(clientm "1", invoice_attrs)
    {:error, fortnox_error}

  """
  def update_invoice(client, invoice_number, invoice_data) do
    Tesla.put(client, "/3/invoices/#{invoice_number}", %{"Invoice" => invoice_data})
    |> process_response("Invoice")
  end

  @doc """
  Deletes a invoice

  ## Examples

    iex> delete_invoice(client, "1")
    :ok

    iex> delete_invoice(client, "missing")
    {:error, fortnox_error}

  """
  def delete_invoice(client, invoice_number) do
    Tesla.delete(client, "/3/invoices/#{invoice_number}")
    |> process_response(nil)
  end
end
