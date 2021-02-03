defmodule FortnoxEx.Models.CompanySetting do
  import FortnoxEx.Utils, only: [process_response: 2]

  @doc """
  Retrieves company settings

  ## Examples

    iex> get_company_settings(client)
    {:ok, %{"Address" => "..."}}

    iex> get_company_settings(client)
    {:error, fortnox_error}

  """
  def get_company_settings(client) do
    Tesla.get(client, "/3/settings/company")
    |> process_response("CompanySettings")
  end
end
