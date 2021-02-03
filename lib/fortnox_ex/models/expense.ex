defmodule FortnoxEx.Models.Expense do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a expense

  ## Examples

    iex> create_expense(client, %{"Name" => "ACME")
    {:ok, %{"ExpenseNumber" => "1", "Name" => "ACME"}}

    iex> create_expense(client, expense_attrs)
    {:error, fortnox_error}

  """
  def create_expense(client, expense_data) do
    Tesla.post(client, "/3/expenses", %{"Expense" => expense_data})
    |> process_response("Expense")
  end

  @doc """
  Gets a list of partial expense objects with pagination information.

  ## Examples

    iex> list_expenses(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"ExpenseNumber" => "1", "Name" => "ACME"}]}

    iex> list_expenses(client, [])
    {:error, fortnox_error}
  """
  def list_expenses(client, query) do
    Tesla.get(client, "/3/expenses", query: query)
    |> process_response("Expenses")
  end

  @doc """
  Streams a partial expense objects. Will go through each page of results with a delay between page.
  The stream will produce a single expense data object for each hit.

  ## Examples

    iex> stream_expenses(client, [])
    stream_of_expenses

    iex> stream_expenses(client, [])
    {:error, fortnox_error}
  """
  def stream_expenses(client, query) do
    stream_resource(client, &list_expenses/2, query)
  end

  @doc """
  Gets a expense

  ## Examples

    iex> get_expense(client, "1")
    {:ok, %{"ExpenseNumber" => "1", "Name" => "Johnny", ...}

    iex> get_expense(clientm "1")
    {:error, fortnox_error}

  """
  def get_expense(client, expense_number) do
    Tesla.get(client, "/3/expenses/#{expense_number}")
    |> process_response("Expense")
  end
end
