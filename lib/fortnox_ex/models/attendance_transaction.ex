defmodule FortnoxEx.Models.AttendanceTransaction do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a attendance_transaction

  ## Examples

    iex> create_attendance_transaction(client, %{"Name" => "ACME")
    {:ok, %{"AttendanceTransactionNumber" => "1", "Name" => "ACME"}}

    iex> create_attendance_transaction(client, attendance_transaction_attrs)
    {:error, fortnox_error}

  """
  def create_attendance_transaction(client, attendance_transaction_data) do
    Tesla.post(client, "/3/attendancetransactions", %{"AttendanceTransaction" => attendance_transaction_data})
    |> process_response("AttendanceTransaction")
  end

  @doc """
  Gets a list of partial attendance_transaction objects with pagination information.

  ## Examples

    iex> list_attendance_transactions(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"AttendanceTransactionNumber" => "1", "Name" => "ACME"}]}

    iex> list_attendance_transactions(client, [])
    {:error, fortnox_error}
  """
  def list_attendance_transactions(client, query) do
    Tesla.get(client, "/3/attendancetransactions", query: query)
    |> process_response("AttendanceTransactions")
  end

  @doc """
  Streams a partial attendance_transaction objects. Will go through each page of results with a delay between page.
  The stream will produce a single attendance_transaction data object for each hit.

  ## Examples

    iex> stream_attendance_transactions(client, [])
    stream_of_attendance_transactions

    iex> stream_attendance_transactions(client, [])
    {:error, fortnox_error}
  """
  def stream_attendance_transactions(client, query) do
    stream_resource(client, &list_attendance_transactions/2, query)
  end

  @doc """
  Gets a attendance_transaction

  ## Examples

    iex> get_attendance_transaction(client, "1")
    {:ok, %{"AttendanceTransactionNumber" => "1", "Name" => "Johnny", ...}

    iex> get_attendance_transaction(clientm "1")
    {:error, fortnox_error}

  """
  def get_attendance_transaction(client, attendance_transaction_number) do
    Tesla.get(client, "/3/attendancetransactions/#{attendance_transaction_number}")
    |> process_response("AttendanceTransaction")
  end

  @doc """
  Updates a attendance_transaction

  ## Examples

    iex> update_attendance_transaction(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"AttendanceTransactionNumber" => "1", "Name" => "Johnny", ...}

    iex> update_attendance_transaction(clientm "1", attendance_transaction_attrs)
    {:error, fortnox_error}

  """
  def update_attendance_transaction(client, attendance_transaction_number, attendance_transaction_data) do
    Tesla.put(client, "/3/attendancetransactions/#{attendance_transaction_number}", %{"AttendanceTransaction" => attendance_transaction_data})
    |> process_response("AttendanceTransaction")
  end

  @doc """
  Deletes a attendance_transaction

  ## Examples

    iex> delete_attendance_transaction(client, "1")
    :ok

    iex> delete_attendance_transaction(client, "missing")
    {:error, fortnox_error}

  """
  def delete_attendance_transaction(client, attendance_transaction_number) do
    Tesla.delete(client, "/3/attendancetransactions/#{attendance_transaction_number}")
    |> process_response(nil)
  end
end
