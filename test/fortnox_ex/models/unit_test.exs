defmodule FortnoxEx.Models.UnitTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_unit/2" do
    test "creates a unit" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, unit} = FortnoxEx.create_unit(client, %{"Name" => "Test Corporation"})
      assert unit["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_units/2" do
    test "fetches units" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, units} = FortnoxEx.list_units(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(units) == 0
    end
  end

  @tag :skip
  describe "stream_units/2" do
    test "streams units" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_units(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["UnitNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_unit/2" do
    test "fetches a unit" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, unit} = FortnoxEx.get_unit(client, "1")
      assert unit["UnitNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_unit/2" do
    test "updates a unit" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, unit} = FortnoxEx.update_unit(client, "1", %{"Name" => "Test Corporation"})
      assert unit["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_unit/2" do
    test "deletes a unit" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_unit(client, "1")
    end
  end
end
