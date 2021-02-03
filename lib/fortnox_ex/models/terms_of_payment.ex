defmodule FortnoxEx.Models.TermsOfPayment do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a terms_of_payment

  ## Examples

    iex> create_terms_of_payment(client, %{"Name" => "ACME")
    {:ok, %{"TermsOfPaymentNumber" => "1", "Name" => "ACME"}}

    iex> create_terms_of_payment(client, terms_of_payment_attrs)
    {:error, fortnox_error}

  """
  def create_terms_of_payment(client, terms_of_payment_data) do
    Tesla.post(client, "/3/termsofpayments", %{"TermsOfPayment" => terms_of_payment_data})
    |> process_response("TermsOfPayment")
  end

  @doc """
  Gets a list of partial terms_of_payment objects with pagination information.

  ## Examples

    iex> list_terms_of_payments(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"TermsOfPaymentNumber" => "1", "Name" => "ACME"}]}

    iex> list_terms_of_payments(client, [])
    {:error, fortnox_error}
  """
  def list_terms_of_payments(client, query) do
    Tesla.get(client, "/3/termsofpayments", query: query)
    |> process_response("TermsOfPayments")
  end

  @doc """
  Streams a partial terms_of_payment objects. Will go through each page of results with a delay between page.
  The stream will produce a single terms_of_payment data object for each hit.

  ## Examples

    iex> stream_terms_of_payments(client, [])
    stream_of_terms_of_payments

    iex> stream_terms_of_payments(client, [])
    {:error, fortnox_error}
  """
  def stream_terms_of_payments(client, query) do
    stream_resource(client, &list_terms_of_payments/2, query)
  end

  @doc """
  Gets a terms_of_payment

  ## Examples

    iex> get_terms_of_payment(client, "1")
    {:ok, %{"TermsOfPaymentNumber" => "1", "Name" => "Johnny", ...}

    iex> get_terms_of_payment(clientm "1")
    {:error, fortnox_error}

  """
  def get_terms_of_payment(client, terms_of_payment_code) do
    Tesla.get(client, "/3/termsofpayments/#{terms_of_payment_code}")
    |> process_response("TermsOfPayment")
  end

  @doc """
  Updates a terms_of_payment

  ## Examples

    iex> update_terms_of_payment(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"TermsOfPaymentNumber" => "1", "Name" => "Johnny", ...}

    iex> update_terms_of_payment(clientm "1", terms_of_payment_attrs)
    {:error, fortnox_error}

  """
  def update_terms_of_payment(client, terms_of_payment_code, terms_of_payment_data) do
    Tesla.put(client, "/3/termsofpayments/#{terms_of_payment_code}", %{"TermsOfPayment" => terms_of_payment_data})
    |> process_response("TermsOfPayment")
  end

  @doc """
  Deletes a supplier_invoice

  ## Examples

    iex> delete_supplier_invoice(client, "1")
    :ok

    iex> delete_supplier_invoice(client, "missing")
    {:error, fortnox_error}

  """
  def delete_terms_of_payment(client, terms_of_payment_code) do
    Tesla.delete(client, "/3/termsofpayments/#{terms_of_payment_code}")
    |> process_response(nil)
  end
end
