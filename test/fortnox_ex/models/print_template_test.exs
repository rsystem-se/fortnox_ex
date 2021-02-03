defmodule FortnoxEx.Models.PrintTemplateTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "list_print_templates/2" do
    test "lists print templates" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, print_templates} = FortnoxEx.list_print_templates(client)
      assert Enum.count(print_templates) == 9
    end
  end
end
