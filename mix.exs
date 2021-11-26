defmodule Marvel.Mixfile do
  use Mix.Project

  def project do
    [
      app: :marvel,
      version: "1.0.0",
      elixir: "~> 1.0",
      escript: escript_config(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: description()
    ]
  end

  defp description do
    """
    Marvel API and CLI Client
    """
  end

  defp escript_config do
    [main_module: Marvel.CLI, name: "marvel"]
  end

  def application do
    [applications: [:logger, :poison, :httpoison]]
  end

  defp deps do
    [
      {:poison, "~> 5.0"},
      {:httpoison, "~> 1.8.0"},
      {:ex_doc, "~> 0.26.0", only: :dev},
      {:excoveralls, only: [:dev, :test]},
      {:shouldi, github: "batate/shouldi", only: :test}
    ]
  end

  defp package do
    # These are the default files included in the package
    [
      files: ["lib", "mix.exs", "README*", "readme*", "LICENSE*", "license*", "CHANGELOG*"],
      contributors: ["Bryan Joseph"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/bryanjos/marvel"
      }
    ]
  end
end
