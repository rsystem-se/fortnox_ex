defmodule FortnoxEx.Models.LabelTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_label/2" do
    test "creates a label" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, label} = FortnoxEx.create_label(client, %{"Name" => "Test Corporation"})
      assert label["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_labels/2" do
    test "fetches labels" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, labels} = FortnoxEx.list_labels(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(labels) == 0
    end
  end

  @tag :skip
  describe "stream_labels/2" do
    test "streams labels" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_labels(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["Id"] == "1"
    end
  end

  @tag :skip
  describe "get_label/2" do
    test "fetches a label" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, label} = FortnoxEx.get_label(client, "1")
      assert label["LabelNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_label/2" do
    test "updates a label" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, label} = FortnoxEx.update_label(client, "1", %{"Name" => "Test Corporation"})
      assert label["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_label/2" do
    test "deletes a label" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_label(client, "1")
    end
  end
end
