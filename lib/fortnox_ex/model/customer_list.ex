# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# https://openapi-generator.tech
# Do not edit the class manually.

defmodule FortnoxEx.Model.CustomerList do
  @moduledoc """
  
  """

  @derive [Poison.Encoder]
  defstruct [
    :"MetaInformation",
    :"Customers"
  ]

  @type t :: %__MODULE__{
    :"MetaInformation" => MetaInformation | nil,
    :"Customers" => [CustomerPartial] | nil
  }
end

defimpl Poison.Decoder, for: FortnoxEx.Model.CustomerList do
  import FortnoxEx.Deserializer
  def decode(value, options) do
    value
    |> deserialize(:"MetaInformation", :struct, FortnoxEx.Model.MetaInformation, options)
    |> deserialize(:"Customers", :list, FortnoxEx.Model.CustomerPartial, options)
  end
end

