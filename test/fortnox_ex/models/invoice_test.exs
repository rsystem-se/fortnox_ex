defmodule FortnoxEx.Models.InvoiceTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_invoice/2" do
    test "creates a invoice" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, invoice} = FortnoxEx.create_invoice(
        client,
        %{"CustomerNumber" => "1", "PeriodEnd" => "2021-12-01", "InvoiceRows" => [%{"ArticleNumber" => "1"}]}
      )
      assert invoice["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_invoices/2" do
    test "fetches invoices" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, invoices} = FortnoxEx.list_invoices(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(invoices) == 0
    end
  end

  @tag :skip
  describe "stream_invoices/2" do
    test "streams invoices" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_invoices(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["DocumentNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_invoice/2" do
    test "fetches a invoice" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, invoice} = FortnoxEx.get_invoice(client, "1")
      assert invoice["DocumentNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_invoice/2" do
    test "updates a invoice" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, invoice} = FortnoxEx.update_invoice(client, "1", %{"CustomerNumber" => "1"})
      assert invoice["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_invoice/2" do
    test "deletes a invoice" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_invoice(client, "1")
    end
  end
end
