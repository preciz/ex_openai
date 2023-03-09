defmodule ExOpenAI.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_openai,
      version: "0.2.0",
      elixir: "~> 1.11",
      description: description(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      name: "ex_openai.ex",
      source_url: "https://github.com/dvcrn/ex_openai",
      preferred_cli_env: [
        vcr: :test,
        "vcr.delete": :test,
        "vcr.check": :test,
        "vcr.show": :test
      ],
      dialyzer: [plt_add_apps: [:mix]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {ExOpenAI, []},
      applications: [:httpoison, :json, :logger, :yaml_elixir],
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    ExOpenAI is an auto-generated Elixir SDK for OpenAI APIs
    """
  end

  defp package do
    [
      licenses: ["MIT"],
      exclude_patterns: ["./config/*"],
      links: %{
        "GitHub" => "https://github.com/dvcrn/ex_openai"
      },
      maintainers: [
        "dvcrn"
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:json, "~> 1.4"},
      {:httpoison, "~> 1.8"},
      {:mock, "~> 0.3.6"},
      {:mix_test_watch, "~> 1.0"},
      {:ex_doc, ">= 0.19.2", only: :dev},
      {:exvcr, "~> 0.11", only: :test},
      {:yaml_elixir, "~> 2.9"},
      {:dialyxir, "~> 1.2", only: [:dev], runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
    ]
  end
end
