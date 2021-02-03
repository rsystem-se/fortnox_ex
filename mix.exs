defmodule FortnoxEx.MixProject do
  use Mix.Project

  @version "0.3.0"
  @github_url "https://github.com/rsystem-se/fortnox_ex"

  def project do
    [
      app: :fortnox_ex,
      version: @version,
      description: description(),
      package: package(),
      name: "FortnoxEx",
      source_url: @github_url,
      elixir: "~> 1.11",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    "Fortnox API client"
  end

  defp package do
    [
      maintainers: ["Nils Ivanson"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @github_url
      }
    ]
  end

  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:tesla, "~> 1.4.0"},
      {:fuse, "~> 2.4"},
      {:hackney, "~> 1.17.0"},
      {:jason, ">= 1.0.0"},
      {:ex_doc, "~> 0.21", only: :dev}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_ref: "v#{@version}",
      extras: ["README.md", "LICENSE"],
      groups_for_modules: [],
      nest_modules_by_prefix: []
    ]
  end
end
