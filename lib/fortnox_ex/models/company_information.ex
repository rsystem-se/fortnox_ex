defmodule FortnoxEx.Models.CompanyInformation do
  import FortnoxEx.Utils, only: [process_response: 2]

  @doc """
  Retrieves company information

  ## Examples

    iex> get_company_information(client)
    {:ok, %{"CompanyName" => "...", "Address" => "..."}}

    iex> get_company_information(client)
    {:error, fortnox_error}

  """
  def get_company_information(client) do
    Tesla.get(client, "/3/companyinformation")
    |> process_response("CompanyInformation")
  end
end
