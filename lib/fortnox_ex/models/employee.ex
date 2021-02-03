defmodule FortnoxEx.Models.Employee do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a employee

  ## Examples

    iex> create_employee(client, %{"Name" => "ACME")
    {:ok, %{"EmployeeNumber" => "1", "Name" => "ACME"}}

    iex> create_employee(client, employee_attrs)
    {:error, fortnox_error}

  """
  def create_employee(client, employee_data) do
    Tesla.post(client, "/3/employees", %{"Employee" => employee_data})
    |> process_response("Employee")
  end

  @doc """
  Gets a list of partial employee objects with pagination information.

  ## Examples

    iex> list_employees(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"EmployeeNumber" => "1", "Name" => "ACME"}]}

    iex> list_employees(client, [])
    {:error, fortnox_error}
  """
  def list_employees(client, query) do
    Tesla.get(client, "/3/employees", query: query)
    |> process_response("Employees")
  end

  @doc """
  Streams a partial employee objects. Will go through each page of results with a delay between page.
  The stream will produce a single employee data object for each hit.

  ## Examples

    iex> stream_employees(client, [])
    stream_of_employees

    iex> stream_employees(client, [])
    {:error, fortnox_error}
  """
  def stream_employees(client, query) do
    stream_resource(client, &list_employees/2, query)
  end

  @doc """
  Gets a employee

  ## Examples

    iex> get_employee(client, "1")
    {:ok, %{"EmployeeNumber" => "1", "Name" => "Johnny", ...}

    iex> get_employee(clientm "1")
    {:error, fortnox_error}

  """
  def get_employee(client, employee_number) do
    Tesla.get(client, "/3/employees/#{employee_number}")
    |> process_response("Employee")
  end

  @doc """
  Updates a employee

  ## Examples

    iex> update_employee(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"EmployeeNumber" => "1", "Name" => "Johnny", ...}

    iex> update_employee(clientm "1", employee_attrs)
    {:error, fortnox_error}

  """
  def update_employee(client, employee_number, employee_data) do
    Tesla.put(client, "/3/employees/#{employee_number}", %{"Employee" => employee_data})
    |> process_response("Employee")
  end

  @doc """
  Deletes a employee

  ## Examples

    iex> delete_employee(client, "1")
    :ok

    iex> delete_employee(client, "missing")
    {:error, fortnox_error}

  """
  def delete_employee(client, employee_number) do
    Tesla.delete(client, "/3/employees/#{employee_number}")
    |> process_response(nil)
  end
end
