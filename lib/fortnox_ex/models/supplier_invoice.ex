defmodule FortnoxEx.Models.SupplierInvoice do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a supplier_invoice

  ## Examples

    iex> create_supplier_invoice(client, %{"Name" => "ACME")
    {:ok, %{"SupplierInvoiceNumber" => "1", "Name" => "ACME"}}

    iex> create_supplier_invoice(client, supplier_invoice_attrs)
    {:error, fortnox_error}

  """
  def create_supplier_invoice(client, supplier_invoice_data) do
    Tesla.post(client, "/3/supplierInvoices", %{"SupplierInvoice" => supplier_invoice_data})
    |> process_response("SupplierInvoice")
  end

  @doc """
  Gets a list of partial supplier_invoice objects with pagination information.

  ## Examples

    iex> list_supplier_invoices(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"SupplierInvoiceNumber" => "1", "Name" => "ACME"}]}

    iex> list_supplier_invoices(client, [])
    {:error, fortnox_error}
  """
  def list_supplier_invoices(client, query) do
    Tesla.get(client, "/3/supplierInvoices", query: query)
    |> process_response("SupplierInvoices")
  end

  @doc """
  Streams a partial supplier_invoice objects. Will go through each page of results with a delay between page.
  The stream will produce a single supplier_invoice data object for each hit.

  ## Examples

    iex> stream_supplier_invoices(client, [])
    stream_of_supplier_invoices

    iex> stream_supplier_invoices(client, [])
    {:error, fortnox_error}
  """
  def stream_supplier_invoices(client, query) do
    stream_resource(client, &list_supplier_invoices/2, query)
  end

  @doc """
  Gets a supplier_invoice

  ## Examples

    iex> get_supplier_invoice(client, "1")
    {:ok, %{"SupplierInvoiceNumber" => "1", "Name" => "Johnny", ...}

    iex> get_supplier_invoice(clientm "1")
    {:error, fortnox_error}

  """
  def get_supplier_invoice(client, supplier_invoice_number) do
    Tesla.get(client, "/3/supplierInvoices/#{supplier_invoice_number}")
    |> process_response("SupplierInvoice")
  end

  @doc """
  Updates a supplier_invoice

  ## Examples

    iex> update_supplier_invoice(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"SupplierInvoiceNumber" => "1", "Name" => "Johnny", ...}

    iex> update_supplier_invoice(clientm "1", supplier_invoice_attrs)
    {:error, fortnox_error}

  """
  def update_supplier_invoice(client, supplier_invoice_number, supplier_invoice_data) do
    Tesla.put(client, "/3/supplierInvoices/#{supplier_invoice_number}", %{"SupplierInvoice" => supplier_invoice_data})
    |> process_response("SupplierInvoice")
  end

  @doc """
  Deletes a supplier_invoice

  ## Examples

    iex> delete_supplier_invoice(client, "1")
    :ok

    iex> delete_supplier_invoice(client, "missing")
    {:error, fortnox_error}

  """
  def delete_supplier_invoice(client, supplier_invoice_number) do
    Tesla.delete(client, "/3/supplierInvoices/#{supplier_invoice_number}")
    |> process_response(nil)
  end
end
