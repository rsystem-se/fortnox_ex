defmodule FortnoxEx.Models.ExpenseTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_expense/2" do
    test "creates a expense" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, expense} = FortnoxEx.create_expense(client, %{"Name" => "Test Corporation"})
      assert expense["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_expenses/2" do
    test "fetches expenses" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, expenses} = FortnoxEx.list_expenses(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(expenses) == 0
    end
  end

  @tag :skip
  describe "stream_expenses/2" do
    test "streams expenses" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_expenses(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["ExpenseNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_expense/2" do
    test "fetches a expense" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, expense} = FortnoxEx.get_expense(client, "1")
      assert expense["ExpenseNumber"] == "1"
    end
  end
end
