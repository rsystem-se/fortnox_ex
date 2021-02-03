defmodule FortnoxExTest do
  use ExUnit.Case

  @tag :skip
  test "test connectivity" do
    FortnoxEx.Connection.new("1234", "567890")
    |> FortnoxEx.Api.Default.list_customers()
  end
end
