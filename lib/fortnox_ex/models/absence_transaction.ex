defmodule FortnoxEx.Models.AbsenceTransaction do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a absence_transaction

  ## Examples

    iex> create_absence_transaction(client, %{"Name" => "ACME")
    {:ok, %{"AbsenceTransactionNumber" => "1", "Name" => "ACME"}}

    iex> create_absence_transaction(client, absence_transaction_attrs)
    {:error, fortnox_error}

  """
  def create_absence_transaction(client, absence_transaction_data) do
    Tesla.post(client, "/3/attendancetransactions", %{"AbsenceTransaction" => absence_transaction_data})
    |> process_response("AbsenceTransaction")
  end

  @doc """
  Gets a list of partial absence_transaction objects with pagination information.

  ## Examples

    iex> list_absence_transactions(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"AbsenceTransactionNumber" => "1", "Name" => "ACME"}]}

    iex> list_absence_transactions(client, [])
    {:error, fortnox_error}
  """
  def list_absence_transactions(client, query) do
    Tesla.get(client, "/3/attendancetransactions", query: query)
    |> process_response("AbsenceTransactions")
  end

  @doc """
  Streams a partial absence_transaction objects. Will go through each page of results with a delay between page.
  The stream will produce a single absence_transaction data object for each hit.

  ## Examples

    iex> stream_absence_transactions(client, [])
    stream_of_absence_transactions

    iex> stream_absence_transactions(client, [])
    {:error, fortnox_error}
  """
  def stream_absence_transactions(client, query) do
    stream_resource(client, &list_absence_transactions/2, query)
  end

  @doc """
  Gets a absence_transaction

  ## Examples

    iex> get_absence_transaction(client, "1")
    {:ok, %{"AbsenceTransactionNumber" => "1", "Name" => "Johnny", ...}

    iex> get_absence_transaction(clientm "1")
    {:error, fortnox_error}

  """
  def get_absence_transaction(client, absence_transaction_number) do
    Tesla.get(client, "/3/attendancetransactions/#{absence_transaction_number}")
    |> process_response("AbsenceTransaction")
  end

  @doc """
  Updates a absence_transaction

  ## Examples

    iex> update_absence_transaction(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"AbsenceTransactionNumber" => "1", "Name" => "Johnny", ...}

    iex> update_absence_transaction(clientm "1", absence_transaction_attrs)
    {:error, fortnox_error}

  """
  def update_absence_transaction(client, absence_transaction_number, absence_transaction_data) do
    Tesla.put(client, "/3/attendancetransactions/#{absence_transaction_number}", %{"AbsenceTransaction" => absence_transaction_data})
    |> process_response("AbsenceTransaction")
  end

  @doc """
  Deletes a absence_transaction

  ## Examples

    iex> delete_absence_transaction(client, "1")
    :ok

    iex> delete_absence_transaction(client, "missing")
    {:error, fortnox_error}

  """
  def delete_absence_transaction(client, absence_transaction_number) do
    Tesla.delete(client, "/3/attendancetransactions/#{absence_transaction_number}")
    |> process_response(nil)
  end
end
