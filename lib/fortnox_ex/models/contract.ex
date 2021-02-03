defmodule FortnoxEx.Models.Contract do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a contract

  ## Examples

    iex> create_contract(client, %{"Name" => "ACME")
    {:ok, %{"DocumentNumber" => "1", "Name" => "ACME"}}

    iex> create_contract(client, contract_attrs)
    {:error, fortnox_error}

  """
  def create_contract(client, contract_data) do
    Tesla.post(client, "/3/contracts", %{"Contract" => contract_data})
    |> process_response("Contract")
  end

  @doc """
  Gets a list of partial contract objects with pagination information.

  ## Examples

    iex> list_contracts(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"DocumentNumber" => "1", "Name" => "ACME"}]}

    iex> list_contracts(client, [])
    {:error, fortnox_error}
  """
  def list_contracts(client, query) do
    Tesla.get(client, "/3/contracts", query: query)
    |> process_response("Contracts")
  end

  @doc """
  Streams a partial contract objects. Will go through each page of results with a delay between page.
  The stream will produce a single contract data object for each hit.

  ## Examples

    iex> stream_contracts(client, [])
    stream_of_contracts

    iex> stream_contracts(client, [])
    {:error, fortnox_error}
  """
  def stream_contracts(client, query) do
    stream_resource(client, &list_contracts/2, query)
  end

  @doc """
  Gets a contract

  ## Examples

    iex> get_contract(client, "1")
    {:ok, %{"DocumentNumber" => "1", "Name" => "Johnny", ...}

    iex> get_contract(clientm "1")
    {:error, fortnox_error}

  """
  def get_contract(client, contract_number) do
    Tesla.get(client, "/3/contracts/#{contract_number}")
    |> process_response("Contract")
  end

  @doc """
  Updates a contract

  ## Examples

    iex> update_contract(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"DocumentNumber" => "1", "Name" => "Johnny", ...}

    iex> update_contract(clientm "1", contract_attrs)
    {:error, fortnox_error}

  """
  def update_contract(client, contract_number, contract_data) do
    Tesla.put(client, "/3/contracts/#{contract_number}", %{"Contract" => contract_data})
    |> process_response("Contract")
  end

  @doc """
  Creates an invoice for a contract

  ## Examples

    iex> create_invoice_for_contract(client, "1")
    {:ok, contract}

    iex> create_invoice_for_contract(client, "missing")
    {:error, fortnox_error}

  """
  def create_invoice_for_contract(client, contract_number) do
    Tesla.put(client, "/3/contracts/#{contract_number}/createinvoice", %{})
    |> process_response("Contract")
  end

  @doc """
  Increases the invoice count for a contract, without creating an invoice

  ## Examples

    iex> increase_invoice_count_for_contract(client, "1")
    {:ok, contract}

    iex> increase_invoice_count_for_contract(client, "missing")
    {:error, fortnox_error}

  """
  def increase_invoice_count_for_contract(client, contract_number) do
    Tesla.put(client, "/3/contracts/#{contract_number}/increaseinvoicecount", %{})
    |> process_response("Contract")
  end

  @doc """
  Finishes a contract

  ## Examples

    iex> finish_contract(client, "1")
    {:ok, contract}

    iex> finish_contract(client, "missing")
    {:error, fortnox_error}

  """
  def finish_contract(client, contract_number) do
    Tesla.put(client, "/3/contracts/#{contract_number}/finish", %{})
    |> process_response("Contract")
  end

  @doc """
  Deletes a contract

  ## Examples

    iex> delete_contract(client, "1")
    :ok

    iex> delete_contract(client, "missing")
    {:error, fortnox_error}

  """
  def delete_contract(client, contract_number) do
    Tesla.delete(client, "/3/contracts/#{contract_number}")
    |> process_response(nil)
  end
end
