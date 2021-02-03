defmodule FortnoxEx.Models.Article do
  import FortnoxEx.Utils, only: [process_response: 2, stream_resource: 3]

  @doc """
  Creates a article

  ## Examples

    iex> create_article(client, %{"Name" => "ACME")
    {:ok, %{"ArticleNumber" => "1", "Name" => "ACME"}}

    iex> create_article(client, article_attrs)
    {:error, fortnox_error}

  """
  def create_article(client, article_data) do
    Tesla.post(client, "/3/articles", %{"Article" => article_data})
    |> process_response("Article")
  end

  @doc """
  Gets a list of partial article objects with pagination information.

  ## Examples

    iex> list_articles(client, [])
    {:ok, %{"@CurrentPage" => 1, "@TotalPages" => 1, "@TotalResources" => 1}, [%{"ArticleNumber" => "1", "Name" => "ACME"}]}

    iex> list_articles(client, [])
    {:error, fortnox_error}
  """
  def list_articles(client, query) do
    Tesla.get(client, "/3/articles", query: query)
    |> process_response("Articles")
  end

  @doc """
  Streams a partial article objects. Will go through each page of results with a delay between page.
  The stream will produce a single article data object for each hit.

  ## Examples

    iex> stream_articles(client, [])
    stream_of_articles

    iex> stream_articles(client, [])
    {:error, fortnox_error}
  """
  def stream_articles(client, query) do
    stream_resource(client, &list_articles/2, query)
  end

  @doc """
  Gets a article

  ## Examples

    iex> get_article(client, "1")
    {:ok, %{"ArticleNumber" => "1", "Name" => "Johnny", ...}

    iex> get_article(clientm "1")
    {:error, fortnox_error}

  """
  def get_article(client, article_number) do
    Tesla.get(client, "/3/articles/#{article_number}")
    |> process_response("Article")
  end

  @doc """
  Updates a article

  ## Examples

    iex> update_article(client, "1", %{"Name" => "Johnny"})
    {:ok, %{"ArticleNumber" => "1", "Name" => "Johnny", ...}

    iex> update_article(clientm "1", article_attrs)
    {:error, fortnox_error}

  """
  def update_article(client, article_number, article_data) do
    Tesla.put(client, "/3/articles/#{article_number}", %{"Article" => article_data})
    |> process_response("Article")
  end

  @doc """
  Deletes a article

  ## Examples

    iex> delete_article(client, "1")
    :ok

    iex> delete_article(client, "missing")
    {:error, fortnox_error}

  """
  def delete_article(client, article_number) do
    Tesla.delete(client, "/3/articles/#{article_number}")
    |> process_response(nil)
  end
end
