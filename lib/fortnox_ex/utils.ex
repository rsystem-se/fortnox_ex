defmodule FortnoxEx.Utils do
  @doc """
  Builds an authenticated client. Requires that you already have an access token for the client secret.
  """
  def client(client_secret, access_token) do
    headers = [
      {"Client-Secret", client_secret},
      {"Access-Token", access_token}
    ]

    middleware = [
      {Tesla.Middleware.BaseUrl, "https://api.fortnox.se"},
      {Tesla.Middleware.Logger, debug: true},
      {Tesla.Middleware.Headers, headers},
      Tesla.Middleware.JSON
    ]

    adapter = {Tesla.Adapter.Hackney, [recv_timeout: 30_000]}
    Tesla.client(middleware, adapter)
  end

  @doc """
  Gets an access token given a client secret and an authorization code

  ## Examples

    iex> get_access_token(client_secret, authorization_code)
    {:ok, "65cc2c87-de81-45d6-c792-aad68528ff17"}

    iex> get_access_token(client_secret, authorization_code)
    {:error, %{"Code" => 2000721, "Error" => 1, "Message" => "Auktoriseringskoden är redan förbrukad."}}

  """
  def get_access_token(client_secret, authorization_code) do
    headers = [
      {"Client-Secret", client_secret},
      {"Authorization-Code", authorization_code}
    ]

    middleware = [
      {Tesla.Middleware.BaseUrl, "https://api.fortnox.se"},
      {Tesla.Middleware.Logger, debug: false},
      {Tesla.Middleware.Headers, headers},
      Tesla.Middleware.JSON
    ]

    adapter = {Tesla.Adapter.Hackney, [recv_timeout: 30_000]}
    client = Tesla.client(middleware, adapter)

    Tesla.get(client, "/3/customers")
    |> process_response("Authorization")
    |> case do
      {:ok, %{"AccessToken" => access_token}} -> {:ok, access_token}
      error -> error
    end
  end

  @doc """
  Extracts the response body with or without MetaInformation.
  """
  def process_response({:ok, %{body: ""}}, nil), do: :ok

  def process_response({:ok, response}, key) do
    case Map.get(response.body, "ErrorInformation") do
      nil -> extract_with_or_without_meta_information(response.body, key)
      error -> {:error, error}
    end
  end

  def process_response(error, _key), do: error

  defp extract_with_or_without_meta_information(body, key) do
    value = Map.fetch!(body, key)

    case Map.get(body, "MetaInformation") do
      nil -> {:ok, value}
      meta_information -> {:ok, meta_information, value}
    end
  end
end
