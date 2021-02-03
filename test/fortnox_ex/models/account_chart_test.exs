defmodule FortnoxEx.Models.Account_chartTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "list_account_charts/2" do
    test "fetches account charts" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, account_charts} = FortnoxEx.list_account_charts(client)
      assert Enum.count(account_charts) == 0
    end
  end
end
