defmodule FortnoxEx.UtilsTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp authorization_code, do: System.fetch_env!("AUTHORIZATION_CODE")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "get_access_token/2" do
    test "exchanges an authorization code for an access token" do
      {:ok, access_token} = FortnoxEx.get_access_token(client_secret(), authorization_code())
      assert is_binary(access_token)
      IO.puts("The access token is: #{access_token}")
    end
  end

  # @tag :skip
  describe "rate limiting" do
    test "blow the fues" do
      client = FortnoxEx.client(client_secret(), access_token())

      {:ok, customer} = FortnoxEx.create_customer(client, %{"Name" => "Fuse Breaker"})

      0..300
      |> Enum.map(
           fn _ ->
             {:ok, customer} = FortnoxEx.get_customer(client, customer["CustomerNumber"])
             assert customer["CustomerNumber"] == customer["CustomerNumber"]
           end
         )
    end
  end
end
