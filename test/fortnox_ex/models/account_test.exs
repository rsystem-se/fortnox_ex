defmodule FortnoxEx.Models.AccountTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_account/2" do
    test "creates a account" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, account} = FortnoxEx.create_account(client, %{"Name" => "Test Corporation"})
      assert account["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_accounts/2" do
    test "fetches accounts" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, accounts} = FortnoxEx.list_accounts(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(accounts) == 0
    end
  end

  @tag :skip
  describe "stream_accounts/2" do
    test "streams accounts" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_accounts(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["AccountNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_account/2" do
    test "fetches a account" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, account} = FortnoxEx.get_account(client, "1")
      assert account["AccountNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_account/2" do
    test "updates a account" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, account} = FortnoxEx.update_account(client, "1", %{"Name" => "Test Corporation"})
      assert account["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_account/2" do
    test "deletes a account" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_account(client, "1")
    end
  end
end
