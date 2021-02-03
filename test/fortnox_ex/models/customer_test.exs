defmodule FortnoxEx.Models.CustomerTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_currency/2" do
    test "creates a currency" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, currency} = FortnoxEx.create_currency(client, %{"Name" => "Test Corporation"})
      assert currency["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_currencys/2" do
    test "fetches currencys" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, currencys} = FortnoxEx.list_currencys(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(currencys) == 0
    end
  end

  @tag :skip
  describe "stream_currencys/2" do
    test "streams currencys" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_currencys(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_currency/2" do
    test "fetches a currency" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, currency} = FortnoxEx.get_currency(client, "1")
      assert currency["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_currency/2" do
    test "updates a currency" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, currency} = FortnoxEx.update_currency(client, "1", %{"Name" => "Test Corporation"})
      assert currency["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_currency/2" do
    test "deletes a currency" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_currency(client, "1")
    end
  end
end
