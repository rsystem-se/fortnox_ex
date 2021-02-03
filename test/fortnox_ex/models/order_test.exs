defmodule FortnoxEx.Models.OrderTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_order/2" do
    test "creates a order" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, order} = FortnoxEx.create_order(
        client,
        %{"CustomerNumber" => "1", "PeriodEnd" => "2021-12-01", "InvoiceRows" => [%{"ArticleNumber" => "1"}]}
      )
      assert order["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_orders/2" do
    test "fetches orders" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, orders} = FortnoxEx.list_orders(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(orders) == 0
    end
  end

  @tag :skip
  describe "stream_orders/2" do
    test "streams orders" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_orders(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["DocumentNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_order/2" do
    test "fetches a order" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, order} = FortnoxEx.get_order(client, "1")
      assert order["DocumentNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_order/2" do
    test "updates a order" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, order} = FortnoxEx.update_order(client, "1", %{"CustomerNumber" => "1"})
      assert order["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_order/2" do
    test "deletes a order" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_order(client, "1")
    end
  end
end
