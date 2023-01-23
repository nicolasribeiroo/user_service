defmodule UserService.MixProject do
  use Mix.Project

  def project do
    [
      app: :user_service,
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {UserService, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:phoenix, "~> 1.6.15"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      {:ecto_sql, "~> 3.2"},
      {:postgrex, "~> 0.15"},
      {:dotenv, "~> 3.0.0"},
      {:pbkdf2_elixir, "~> 2.0"},
      {:poison, "~> 5.0"}
    ]
  end
end
