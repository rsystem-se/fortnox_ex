defmodule FortnoxEx.Models.ModesOfPayment do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a modes_of_payment

  ## Examples

    iex> create_modes_of_payment(client, %{"Name" => "ACME")
    {:ok, %{"Modes_of_paymentNumber" => "1", "Name" => "ACME"}}

    iex> create_modes_of_payment(client, modes_of_payment_attrs)
    {:error, fortnox_error}

  """
  def create_modes_of_payment(client, modes_of_payment_data) do
    Tesla.post(client, "/3/modesofpayments", %{"Modes_of_payment" => modes_of_payment_data})
    |> process_response("Modes_of_payment")
  end

  @doc """
  Gets a list of partial modes_of_payment objects with pagination information.

  ## Examples

    iex> list_modes_of_payments(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"Modes_of_paymentNumber" => "1", "Name" => "ACME"}]}

    iex> list_modes_of_payments(client, [])
    {:error, fortnox_error}
  """
  def list_modes_of_payments(client, query) do
    Tesla.get(client, "/3/modesofpayments", query: query)
    |> process_response("Modes_of_payments")
  end

  @doc """
  Streams a partial modes_of_payment objects. Will go through each page of results with a delay between page.
  The stream will produce a single modes_of_payment data object for each hit.

  ## Examples

    iex> stream_modes_of_payments(client, [])
    stream_of_modes_of_payments

    iex> stream_modes_of_payments(client, [])
    {:error, fortnox_error}
  """
  def stream_modes_of_payments(client, query) do
    stream_resource(client, &list_modes_of_payments/2, query)
  end

  @doc """
  Gets a modes_of_payment

  ## Examples

    iex> get_modes_of_payment(client, "1")
    {:ok, %{"Modes_of_paymentNumber" => "1", "Name" => "Johnny", ...}

    iex> get_modes_of_payment(clientm "1")
    {:error, fortnox_error}

  """
  def get_modes_of_payment(client, modes_of_payment_code) do
    Tesla.get(client, "/3/modesofpayments/#{modes_of_payment_code}")
    |> process_response("Modes_of_payment")
  end

  @doc """
  Updates a modes_of_payment

  ## Examples

    iex> update_modes_of_payment(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"Modes_of_paymentNumber" => "1", "Name" => "Johnny", ...}

    iex> update_modes_of_payment(clientm "1", modes_of_payment_attrs)
    {:error, fortnox_error}

  """
  def update_modes_of_payment(client, modes_of_payment_code, modes_of_payment_data) do
    Tesla.put(client, "/3/modesofpayments/#{modes_of_payment_code}", %{"Modes_of_payment" => modes_of_payment_data})
    |> process_response("Modes_of_payment")
  end
end
