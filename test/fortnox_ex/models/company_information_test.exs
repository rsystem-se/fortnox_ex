defmodule FortnoxEx.Models.CompanyInformationTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "get_company_information/1" do
    test "gets company information" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, company_info} = FortnoxEx.get_company_information(client)
      assert company_info["CompanyName"] == "Test"
    end
  end
end
