defmodule Ui.MixProject do
  use Mix.Project

  def project do
    [
      app: :ui,
      version: "0.1.0",
      elixir: "~> 1.7-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :cowboy, :plug, :poison, :engine],
      mod: {Ui.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.4.0"},
      {:plug, "~> 1.6.1"},
      {:poison, "~> 3.1.0"},
      {:engine, in_umbrella: true}
    ]
  end
end
