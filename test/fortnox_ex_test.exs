defmodule FortnoxExTest do
  use ExUnit.Case

  @tag :skip
  test "test connectivity" do
    FortnoxEx.Connection.new("1234", "567890")
    |> FortnoxEx.Api.Default.list_customers()
  end

  @tag :skip
  test "test get_auth_code" do
    {:ok, access_token} = FortnoxEx.Connection.get_access_token("1234", "567890")
  end
end
