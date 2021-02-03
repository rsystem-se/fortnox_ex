defmodule FortnoxEx.Models.SupplierTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_supplier/2" do
    test "creates a supplier" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, supplier} = FortnoxEx.create_supplier(client, %{"Name" => "Test Corporation"})
      assert supplier["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_suppliers/2" do
    test "fetches suppliers" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, suppliers} = FortnoxEx.list_suppliers(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(suppliers) == 0
    end
  end

  @tag :skip
  describe "stream_suppliers/2" do
    test "streams suppliers" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_suppliers(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["SupplierNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_supplier/2" do
    test "fetches a supplier" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, supplier} = FortnoxEx.get_supplier(client, "1")
      assert supplier["SupplierNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_supplier/2" do
    test "updates a supplier" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, supplier} = FortnoxEx.update_supplier(client, "1", %{"Name" => "Test Corporation"})
      assert supplier["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_supplier/2" do
    test "deletes a supplier" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_supplier(client, "1")
    end
  end
end
