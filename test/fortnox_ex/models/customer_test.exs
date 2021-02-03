defmodule FortnoxEx.Models.CustomerTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_customer/2" do
    test "creates a customer" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, customer} = FortnoxEx.create_customer(client, %{"Name" => "Test Corporation"})
      assert customer["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_customers/2" do
    test "fetches customers" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, customers} = FortnoxEx.list_customers(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(customers) == 0
    end
  end

  @tag :skip
  describe "stream_customers/2" do
    test "streams customers" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_customers(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_customer/2" do
    test "fetches a customer" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, customer} = FortnoxEx.get_customer(client, "1")
      assert customer["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_customer/2" do
    test "updates a customer" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, customer} = FortnoxEx.update_customer(client, "1", %{"Name" => "Test Corporation"})
      assert customer["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_customer/2" do
    test "deletes a customer" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_customer(client, "1")
    end
  end
end
