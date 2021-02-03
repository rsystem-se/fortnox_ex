defmodule FortnoxEx.Models.ArticleTest do
  @moduledoc nil
  use ExUnit.Case

  defp client_secret, do: System.fetch_env!("CLIENT_SECRET")
  defp access_token, do: System.fetch_env!("ACCESS_TOKEN")

  @tag :skip
  describe "create_article/2" do
    test "creates a article" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, article} = FortnoxEx.create_article(client, %{"ArticleNumber" => "TESTARTICLE", "Description" => "Test Article"})
      assert article["ArticleNumber"] == "TESTARTICLE"
    end
  end

  @tag :skip
  describe "list_articles/2" do
    test "fetches articles" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, meta, articles} = FortnoxEx.list_articles(client, [])
      assert meta == %{"@CurrentPage" => 1, "@TotalPages" => 0, "@TotalResources" => 0}
      assert Enum.count(articles) == 0
    end
  end

  @tag :skip
  describe "stream_articles/2" do
    test "streams articles" do
      client = FortnoxEx.client(client_secret(), access_token())
      stream = FortnoxEx.stream_articles(client, [limit: 5])
      [first | _] = Enum.to_list(stream)
      assert first["ArticleNumber"] == "1"
    end
  end

  @tag :skip
  describe "get_article/2" do
    test "fetches a article" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, article} = FortnoxEx.get_article(client, "1")
      assert article["ArticleNumber"] == "1"
    end
  end

  @tag :skip
  describe "update_article/2" do
    test "updates a article" do
      client = FortnoxEx.client(client_secret(), access_token())
      {:ok, article} = FortnoxEx.update_article(client, "1", %{"Name" => "Test Corporation"})
      assert article["Name"] == "Test Corporation"
    end
  end

  @tag :skip
  describe "delete_article/2" do
    test "deletes a article" do
      client = FortnoxEx.client(client_secret(), access_token())
      :ok = FortnoxEx.delete_article(client, "1")
    end
  end
end
