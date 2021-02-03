defmodule FortnoxEx.Models.InvoicePaymentTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_invoice_payment/2" do
    test "creates a invoice_payment" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, invoice_payment} = FortnoxEx.create_invoice_payment(client, %{"Name" => "Test Corporation"})
      assert invoice_payment["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_invoice_payments/2" do
    test "fetches invoice_payments" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, invoice_payments} = FortnoxEx.list_invoice_payments(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(invoice_payments) == 0
    end
  end

  @tag :skip
  describe "stream_invoice_payments/2" do
    test "streams invoice_payments" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_invoice_payments(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_invoice_payment/2" do
    test "fetches a invoice_payment" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, invoice_payment} = FortnoxEx.get_invoice_payment(client, "1")
      assert invoice_payment["CustomerNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_invoice_payment/2" do
    test "updates a invoice_payment" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, invoice_payment} = FortnoxEx.update_invoice_payment(client, "1", %{"Name" => "Test Corporation"})
      assert invoice_payment["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_invoice_payment/2" do
    test "deletes a invoice_payment" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_invoice_payment(client, "1")
    end
  end
end
