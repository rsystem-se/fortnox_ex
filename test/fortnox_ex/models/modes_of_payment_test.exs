defmodule FortnoxEx.Models.ModesOfPaymentTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_modes_of_payment/2" do
    test "creates a modes_of_payment" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, modes_of_payment} = FortnoxEx.create_modes_of_payment(client, %{"Name" => "Test Corporation"})
      assert modes_of_payment["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "list_modes_of_payments/2" do
    test "fetches modes_of_payments" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, modes_of_payments} = FortnoxEx.list_modes_of_payments(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(modes_of_payments) == 0
    end
  end

  @tag :skip
  describe "stream_modes_of_payments/2" do
    test "streams modes_of_payments" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_modes_of_payments(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["ModesOfPaymentNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_modes_of_payment/2" do
    test "fetches a modes_of_payment" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, modes_of_payment} = FortnoxEx.get_modes_of_payment(client, "1")
      assert modes_of_payment["ModesOfPaymentNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_modes_of_payment/2" do
    test "updates a modes_of_payment" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, modes_of_payment} = FortnoxEx.update_modes_of_payment(client, "1", %{"Name" => "Test Corporation"})
      assert modes_of_payment["Name"] == "Test Corporation"
    end
  end
end
