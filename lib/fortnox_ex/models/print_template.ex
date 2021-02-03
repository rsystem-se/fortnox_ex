defmodule FortnoxEx.Models.PrintTemplate do
  import FortnoxEx.Utils, only: [process_response: 2]

  @doc """
  Gets a list of partial print_template objects with pagination information.

  ## Examples

    iex> list_print_templates(client)
    {:ok, [%{"Template" => "st", "Name" => "Standardmall"}]}

    iex> list_print_templates(client)
    {:error, fortnox_error}
  """
  def list_print_templates(client) do
    Tesla.get(client, "/3/printtemplates")
    |> process_response("PrintTemplates")
  end
end
