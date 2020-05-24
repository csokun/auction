defmodule Auction.MixProject do
  use Mix.Project

  def project do
    [
      app: :auction,
      version: "0.1.0",
      elixir: "~> 1.10",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Auction.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto_sql, "~> 3.3.4"},
      {:postgrex, "~> 0.15.3"},
      {:uuid, "~> 1.1.8"},
      {:comeonin, "~> 5.3.1"},
      {:pbkdf2_elixir, "1.2.1"}
    ]
  end

  def aliases do
    [test: ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
