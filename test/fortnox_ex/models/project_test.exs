defmodule FortnoxEx.Models.ProjectTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_project/2" do
    test "creates a project" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, project} = FortnoxEx.create_project(client, %{"Name" => "Test Corporation"})
      assert project["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_projects/2" do
    test "fetches projects" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, projects} = FortnoxEx.list_projects(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(projects) == 0
    end
  end

  @tag :skip
  describe "stream_projects/2" do
    test "streams projects" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_projects(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["ProjectNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_project/2" do
    test "fetches a project" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, project} = FortnoxEx.get_project(client, "1")
      assert project["ProjectNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_project/2" do
    test "updates a project" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, project} = FortnoxEx.update_project(client, "1", %{"Name" => "Test Corporation"})
      assert project["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_project/2" do
    test "deletes a project" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_project(client, "1")
    end
  end
end
