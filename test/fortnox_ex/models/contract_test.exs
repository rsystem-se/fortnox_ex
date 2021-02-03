defmodule FortnoxEx.Models.ContractTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_contract/2" do
    test "creates a contract" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, contract} = FortnoxEx.create_contract(
        client,
        %{"CustomerNumber" => "1", "PeriodEnd" => "2021-12-01", "InvoiceRows" => [%{"ArticleNumber" => "TESTARTICLE"}]}
      )
      assert contract["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "list_contracts/2" do
    test "fetches contracts" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, contracts} = FortnoxEx.list_contracts(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}
      assert Enum.count(contracts) == 1
    end
  end

  @tag :skip
  describe "stream_contracts/2" do
    test "streams contracts" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_contracts(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["DocumentNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_contract/2" do
    test "fetches a contract" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, contract} = FortnoxEx.get_contract(client, "1")
      assert contract["DocumentNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_contract/2" do
    test "updates a contract" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, contract} = FortnoxEx.update_contract(client, "1", %{"CustomerNumber" => "1"})
      assert contract["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "create_invoice_for_contract/2" do
    test "creates an invoice for a contract" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, contract} = FortnoxEx.create_invoice_for_contract(client, "1")
      assert contract["DocumentNumber"] == "1"
    end
  end

  @tag :skip
  describe "increase_invoice_count_for_contract/2" do
    test "moves a contract forward without creating an invoice" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, contract} = FortnoxEx.increase_invoice_count_for_contract(client, "1")
      assert contract["DocumentNumber"] == "1"
    end
  end

  @tag :skip
  describe "finish_contract/2" do
    test "finishes a contract" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, contract} = FortnoxEx.finish_contract(client, "1")
      assert contract["DocumentNumber"] == "1"
    end
  end

  @tag :skip
  describe "delete_contract/2" do
    test "deletes a contract" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_contract(client, "1")
    end
  end
end
