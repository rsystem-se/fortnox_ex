defmodule FortnoxEx.Models.AccountChart do
  import FortnoxEx.Utils, only: [process_response: 2]

  @doc """
  Gets a list of partial account_chart objects with pagination information.

  ## Examples

    iex> list_account_charts(client)
    {:ok, [%{"Name" => "Bas"}]}

    iex> list_account_charts(client)
    {:error, fortnox_error}
  """
  def list_account_charts(client) do
    Tesla.get(client, "/3/accountcharts")
    |> process_response("AccountCharts")
  end
end
