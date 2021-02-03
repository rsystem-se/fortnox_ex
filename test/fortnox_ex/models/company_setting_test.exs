defmodule FortnoxEx.Models.CompanySettingTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "get_company_setting/1" do
    test "gets company setting" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, company_setting} = FortnoxEx.get_company_settings(client)
      assert company_setting["CompanyName"] == "Test"
    end
  end
end
