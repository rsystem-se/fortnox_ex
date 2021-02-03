defmodule FortnoxEx.Models.TermsOfDeliveryTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_terms_of_delivery/2" do
    test "creates a terms_of_delivery" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, terms_of_delivery} = FortnoxEx.create_terms_of_delivery(client, %{"Name" => "Test Corporation"})
      assert terms_of_delivery["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_terms_of_deliverys/2" do
    test "fetches terms_of_deliverys" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, terms_of_deliverys} = FortnoxEx.list_terms_of_deliverys(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(terms_of_deliverys) == 0
    end
  end

  @tag :skip
  describe "stream_terms_of_deliverys/2" do
    test "streams terms_of_deliverys" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_terms_of_deliverys(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["ModesOfDeliveryNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_terms_of_delivery/2" do
    test "fetches a terms_of_delivery" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, terms_of_delivery} = FortnoxEx.get_terms_of_delivery(client, "1")
      assert terms_of_delivery["ModesOfDeliveryNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_terms_of_delivery/2" do
    test "updates a terms_of_delivery" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, terms_of_delivery} = FortnoxEx.update_terms_of_delivery(client, "1", %{"Name" => "Test Corporation"})
      assert terms_of_delivery["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_terms_of_delivery/2" do
    test "deletes a terms_of_delivery" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_terms_of_delivery(client, "1")
    end
  end
end
