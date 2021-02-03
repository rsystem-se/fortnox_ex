defmodule FortnoxEx.Models.AbsenceTransactionTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_absence_transaction/2" do
    test "creates a absence_transaction" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, absence_transaction} = FortnoxEx.create_absence_transaction(client, %{"Name" => "Test Corporation"})
      assert absence_transaction["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_absence_transactions/2" do
    test "fetches absence_transactions" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, absence_transactions} = FortnoxEx.list_absence_transactions(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(absence_transactions) == 0
    end
  end

  @tag :skip
  describe "stream_absence_transactions/2" do
    test "streams absence_transactions" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_absence_transactions(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_absence_transaction/2" do
    test "fetches a absence_transaction" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, absence_transaction} = FortnoxEx.get_absence_transaction(client, "1")
      assert absence_transaction["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_absence_transaction/2" do
    test "updates a absence_transaction" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, absence_transaction} = FortnoxEx.update_absence_transaction(client, "1", %{"Name" => "Test Corporation"})
      assert absence_transaction["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_absence_transaction/2" do
    test "deletes a absence_transaction" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_absence_transaction(client, "1")
    end
  end
end
