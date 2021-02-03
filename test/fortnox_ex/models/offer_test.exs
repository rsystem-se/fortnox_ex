defmodule FortnoxEx.Models.OfferTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_offer/2" do
    test "creates a offer" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, offer} = FortnoxEx.create_offer(
        client,
        %{"CustomerNumber" => "1", "PeriodEnd" => "2021-12-01", "InvoiceRows" => [%{"ArticleNumber" => "1"}]}
      )
      assert offer["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_offers/2" do
    test "fetches offers" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, offers} = FortnoxEx.list_offers(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(offers) == 0
    end
  end

  @tag :skip
  describe "stream_offers/2" do
    test "streams offers" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_offers(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["DocumentNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_offer/2" do
    test "fetches a offer" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, offer} = FortnoxEx.get_offer(client, "1")
      assert offer["DocumentNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_offer/2" do
    test "updates a offer" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, offer} = FortnoxEx.update_offer(client, "1", %{"CustomerNumber" => "1"})
      assert offer["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_offer/2" do
    test "deletes a offer" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_offer(client, "1")
    end
  end
end
