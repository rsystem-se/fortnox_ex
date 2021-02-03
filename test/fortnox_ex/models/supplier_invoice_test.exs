defmodule FortnoxEx.Models.SupplierInvoiceTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_supplier_invoice/2" do
    test "creates a supplier_invoice" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, supplier_invoice} = FortnoxEx.create_supplier_invoice(client, %{"Name" => "Test Corporation"})
      assert supplier_invoice["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_supplier_invoices/2" do
    test "fetches supplier_invoices" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, supplier_invoices} = FortnoxEx.list_supplier_invoices(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(supplier_invoices) == 0
    end
  end

  @tag :skip
  describe "stream_supplier_invoices/2" do
    test "streams supplier_invoices" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_supplier_invoices(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_supplier_invoice/2" do
    test "fetches a supplier_invoice" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, supplier_invoice} = FortnoxEx.get_supplier_invoice(client, "1")
      assert supplier_invoice["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_supplier_invoice/2" do
    test "updates a supplier_invoice" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, supplier_invoice} = FortnoxEx.update_supplier_invoice(client, "1", %{"Name" => "Test Corporation"})
      assert supplier_invoice["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_supplier_invoice/2" do
    test "deletes a supplier_invoice" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_supplier_invoice(client, "1")
    end
  end
end
