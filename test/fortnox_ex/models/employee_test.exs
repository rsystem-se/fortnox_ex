defmodule FortnoxEx.Models.EmployeeTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_employee/2" do
    test "creates a employee" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, employee} = FortnoxEx.create_employee(client, %{"Name" => "Test Corporation"})
      assert employee["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_employees/2" do
    test "fetches employees" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, employees} = FortnoxEx.list_employees(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(employees) == 0
    end
  end

  @tag :skip
  describe "stream_employees/2" do
    test "streams employees" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_employees(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["EmployeeNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_employee/2" do
    test "fetches a employee" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, employee} = FortnoxEx.get_employee(client, "1")
      assert employee["EmployeeNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_employee/2" do
    test "updates a employee" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, employee} = FortnoxEx.update_employee(client, "1", %{"Name" => "Test Corporation"})
      assert employee["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_employee/2" do
    test "deletes a employee" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_employee(client, "1")
    end
  end
end
