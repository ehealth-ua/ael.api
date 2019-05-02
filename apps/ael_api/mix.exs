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
      {:confex, "~> 3.4"},
      {:jason, "~> 1.1"},
      {:plug_cowboy, "~> 2.0"},
      {:plug, "~> 1.7"},
      {:httpoison, ">= 0.0.0"},
      {:phoenix, "~> 1.4.0"},
      {:eview, "~> 0.15.0"},
      {:ecto, "~> 3.0"},
      {:ehealth_logger, git: "https://github.com/edenlabllc/ehealth_logger.git"},
      {:phoenix_ecto, "~> 4.0"},
      {:ex_aws, "~> 2.1"},
      {:kube_rpc, "~> 0.2.0"},
      {:libcluster, "~> 3.0", git: "https://github.com/AlexKovalevych/libcluster.git", branch: "kube_namespaces"}
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
