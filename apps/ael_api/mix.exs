defmodule Ael.Mixfile do
  use Mix.Project

  def project do
    [
      version: "0.1.0",
      app: :ael_api,
      description: "Media content storage access control system.",
      package: package(),
      elixir: "~> 1.8.1",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixirc_paths: elixirc_paths(Mix.env()),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [coveralls: :test]
    ]
  end

  def application do
    [extra_applications: [:logger, :runtime_tools, :crypto, :public_key], mod: {Ael, []}]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:confex_config_provider, "~> 0.1.0"},
      {:confex, "~> 3.3"},
      {:poison, "~> 3.1"},
      {:cowboy, "~> 1.1"},
      {:httpoison, ">= 0.0.0"},
      {:phoenix, "~> 1.3.3"},
      {:eview, "~> 0.12"},
      {:ecto, "~> 2.1"},
      {:plug_logger_json, "~> 0.5.0"},
      {:ecto_logger_json, "~> 0.1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:ex_aws, "~> 2.0"}
    ]
  end

  defp package do
    [
      contributors: ["Edenlab LLC"],
      maintainers: ["Edenlab LLC"],
      licenses: ["LISENSE.md"],
      links: %{github: "https://github.com/edenlabllc/ael.api"},
      files: ~w(lib LICENSE.md mix.exs README.md)
    ]
  end

  defp aliases do
    [
      "ecto.setup": []
    ]
  end
end
