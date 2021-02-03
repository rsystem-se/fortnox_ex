defmodule FortnoxEx.Models.WayOfDeliveryTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_way_of_delivery/2" do
    test "creates a way_of_delivery" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, way_of_delivery} = FortnoxEx.create_way_of_delivery(client, %{"Name" => "Test Corporation"})
      assert way_of_delivery["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_way_of_deliverys/2" do
    test "fetches way_of_deliverys" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, way_of_deliverys} = FortnoxEx.list_way_of_deliverys(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(way_of_deliverys) == 0
    end
  end

  @tag :skip
  describe "stream_way_of_deliverys/2" do
    test "streams way_of_deliverys" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_way_of_deliverys(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["ModesOfDeliveryNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_way_of_delivery/2" do
    test "fetches a way_of_delivery" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, way_of_delivery} = FortnoxEx.get_way_of_delivery(client, "1")
      assert way_of_delivery["ModesOfDeliveryNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_way_of_delivery/2" do
    test "updates a way_of_delivery" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, way_of_delivery} = FortnoxEx.update_way_of_delivery(client, "1", %{"Name" => "Test Corporation"})
      assert way_of_delivery["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_way_of_delivery/2" do
    test "deletes a way_of_delivery" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_way_of_delivery(client, "1")
    end
  end
end
