defmodule FortnoxEx.Models.InvoicePayment do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a invoice_payment

  ## Examples

    iex> create_invoice_payment(client, %{"Name" => "ACME")
    {:ok, %{"InvoicePaymentNumber" => "1", "Name" => "ACME"}}

    iex> create_invoice_payment(client, invoice_payment_attrs)
    {:error, fortnox_error}

  """
  def create_invoice_payment(client, invoice_payment_data) do
    Tesla.post(client, "/3/invoicepayments", %{"InvoicePayment" => invoice_payment_data})
    |> process_response("InvoicePayment")
  end

  @doc """
  Gets a list of partial invoice_payment objects with pagination information.

  ## Examples

    iex> list_invoice_payments(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"InvoicePaymentNumber" => "1", "Name" => "ACME"}]}

    iex> list_invoice_payments(client, [])
    {:error, fortnox_error}
  """
  def list_invoice_payments(client, query) do
    Tesla.get(client, "/3/invoicepayments", query: query)
    |> process_response("InvoicePayments")
  end

  @doc """
  Streams a partial invoice_payment objects. Will go through each page of results with a delay between page.
  The stream will produce a single invoice_payment data object for each hit.

  ## Examples

    iex> stream_invoice_payments(client, [])
    stream_of_invoice_payments

    iex> stream_invoice_payments(client, [])
    {:error, fortnox_error}
  """
  def stream_invoice_payments(client, query) do
    stream_resource(client, &list_invoice_payments/2, query)
  end

  @doc """
  Gets a invoice_payment

  ## Examples

    iex> get_invoice_payment(client, "1")
    {:ok, %{"InvoicePaymentNumber" => "1", "Name" => "Johnny", ...}

    iex> get_invoice_payment(clientm "1")
    {:error, fortnox_error}

  """
  def get_invoice_payment(client, invoice_payment_number) do
    Tesla.get(client, "/3/invoicepayments/#{invoice_payment_number}")
    |> process_response("InvoicePayment")
  end

  @doc """
  Updates a invoice_payment

  ## Examples

    iex> update_invoice_payment(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"InvoicePaymentNumber" => "1", "Name" => "Johnny", ...}

    iex> update_invoice_payment(clientm "1", invoice_payment_attrs)
    {:error, fortnox_error}

  """
  def update_invoice_payment(client, invoice_payment_number, invoice_payment_data) do
    Tesla.put(client, "/3/invoicepayments/#{invoice_payment_number}", %{"InvoicePayment" => invoice_payment_data})
    |> process_response("InvoicePayment")
  end

  @doc """
  Deletes a invoice_payment

  ## Examples

    iex> delete_invoice_payment(client, "1")
    :ok

    iex> delete_invoice_payment(client, "missing")
    {:error, fortnox_error}

  """
  def delete_invoice_payment(client, invoice_payment_number) do
    Tesla.delete(client, "/3/invoicepayments/#{invoice_payment_number}")
    |> process_response(nil)
  end
end
