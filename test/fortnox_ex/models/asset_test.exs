defmodule FortnoxEx.Models.AssetTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_asset/2" do
    test "creates a asset" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, asset} = FortnoxEx.create_asset(client, %{"Name" => "Test Corporation"})
      assert asset["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_assets/2" do
    test "fetches assets" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, assets} = FortnoxEx.list_assets(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(assets) == 0
    end
  end

  @tag :skip
  describe "stream_assets/2" do
    test "streams assets" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_assets(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["AssetNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_asset/2" do
    test "fetches a asset" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, asset} = FortnoxEx.get_asset(client, "1")
      assert asset["AssetNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_asset/2" do
    test "updates a asset" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, asset} = FortnoxEx.update_asset(client, "1", %{"Name" => "Test Corporation"})
      assert asset["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_asset/2" do
    test "deletes a asset" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_asset(client, "1")
    end
  end
end
