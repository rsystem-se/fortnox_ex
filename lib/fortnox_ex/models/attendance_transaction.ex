defmodule FortnoxEx.Models.AttendanceTransaction do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a attenance_transaction

  ## Examples

    iex> create_attenance_transaction(client, %{"Name" => "ACME")
    {:ok, %{"AttendanceTransactionNumber" => "1", "Name" => "ACME"}}

    iex> create_attenance_transaction(client, attenance_transaction_attrs)
    {:error, fortnox_error}

  """
  def create_attenance_transaction(client, attenance_transaction_data) do
    Tesla.post(client, "/3/attendancetransactions", %{"AttendanceTransaction" => attenance_transaction_data})
    |> process_response("AttendanceTransaction")
  end

  @doc """
  Gets a list of partial attenance_transaction objects with pagination information.

  ## Examples

    iex> list_attenance_transactions(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"AttendanceTransactionNumber" => "1", "Name" => "ACME"}]}

    iex> list_attenance_transactions(client, [])
    {:error, fortnox_error}
  """
  def list_attenance_transactions(client, query) do
    Tesla.get(client, "/3/attendancetransactions", query: query)
    |> process_response("AttendanceTransactions")
  end

  @doc """
  Streams a partial attenance_transaction objects. Will go through each page of results with a delay between page.
  The stream will produce a single attenance_transaction data object for each hit.

  ## Examples

    iex> stream_attenance_transactions(client, [])
    stream_of_attenance_transactions

    iex> stream_attenance_transactions(client, [])
    {:error, fortnox_error}
  """
  def stream_attenance_transactions(client, query) do
    stream_resource(client, &list_attenance_transactions/2, query)
  end

  @doc """
  Gets a attenance_transaction

  ## Examples

    iex> get_attenance_transaction(client, "1")
    {:ok, %{"AttendanceTransactionNumber" => "1", "Name" => "Johnny", ...}

    iex> get_attenance_transaction(clientm "1")
    {:error, fortnox_error}

  """
  def get_attenance_transaction(client, attenance_transaction_number) do
    Tesla.get(client, "/3/attendancetransactions/#{attenance_transaction_number}")
    |> process_response("AttendanceTransaction")
  end

  @doc """
  Updates a attenance_transaction

  ## Examples

    iex> update_attenance_transaction(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"AttendanceTransactionNumber" => "1", "Name" => "Johnny", ...}

    iex> update_attenance_transaction(clientm "1", attenance_transaction_attrs)
    {:error, fortnox_error}

  """
  def update_attenance_transaction(client, attenance_transaction_number, attenance_transaction_data) do
    Tesla.put(client, "/3/attendancetransactions/#{attenance_transaction_number}", %{"AttendanceTransaction" => attenance_transaction_data})
    |> process_response("AttendanceTransaction")
  end

  @doc """
  Deletes a attenance_transaction

  ## Examples

    iex> delete_attenance_transaction(client, "1")
    :ok

    iex> delete_attenance_transaction(client, "missing")
    {:error, fortnox_error}

  """
  def delete_attenance_transaction(client, attenance_transaction_number) do
    Tesla.delete(client, "/3/attendancetransactions/#{attenance_transaction_number}")
    |> process_response(nil)
  end
end
