defmodule FortnoxEx.Models.AttendanceTransactionTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_attendance_transaction/2" do
    test "creates a attendance_transaction" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, attendance_transaction} = FortnoxEx.create_attendance_transaction(client, %{"Name" => "Test Corporation"})
      assert attendance_transaction["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_attendance_transactions/2" do
    test "fetches attendance_transactions" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, attendance_transactions} = FortnoxEx.list_attendance_transactions(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(attendance_transactions) == 0
    end
  end

  @tag :skip
  describe "stream_attendance_transactions/2" do
    test "streams attendance_transactions" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_attendance_transactions(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_attendance_transaction/2" do
    test "fetches a attendance_transaction" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, attendance_transaction} = FortnoxEx.get_attendance_transaction(client, "1")
      assert attendance_transaction["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_attendance_transaction/2" do
    test "updates a attendance_transaction" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, attendance_transaction} = FortnoxEx.update_attendance_transaction(client, "1", %{"Name" => "Test Corporation"})
      assert attendance_transaction["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_attendance_transaction/2" do
    test "deletes a attendance_transaction" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_attendance_transaction(client, "1")
    end
  end
end
