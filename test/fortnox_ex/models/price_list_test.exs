defmodule FortnoxEx.Models.PriceListTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_price_list/2" do
    test "creates a price_list" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, price_list} = FortnoxEx.create_price_list(client, %{"Name" => "Test Corporation"})
      assert price_list["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_price_lists/2" do
    test "fetches price_lists" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, price_lists} = FortnoxEx.list_price_lists(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(price_lists) == 0
    end
  end

  @tag :skip
  describe "stream_price_lists/2" do
    test "streams price_lists" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_price_lists(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_price_list/2" do
    test "fetches a price_list" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, price_list} = FortnoxEx.get_price_list(client, "1")
      assert price_list["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_price_list/2" do
    test "updates a price_list" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, price_list} = FortnoxEx.update_price_list(client, "1", %{"Name" => "Test Corporation"})
      assert price_list["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_price_list/2" do
    test "deletes a price_list" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_price_list(client, "1")
    end
  end
end
