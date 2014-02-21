defmodule Exprox.Mixfile do
  use Mix.Project

  def project do
    [ app: :exprox,
      version: "0.0.1",
      elixir: "~> 0.12.4",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { Exprox, [] },
      applications: [ :httpotion, :cowboy ]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, git: "https://github.com/elixir-lang/foobar.git", tag: "0.1" }
  #
  # To specify particular versions, regardless of the tag, do:
  # { :barbat, "~> 0.1", github: "elixir-lang/barbat" }
  defp deps do
    [
      { :httpotion, github: "myfreeweb/httpotion" },
      {:cowboy, github: "extend/cowboy"}
    ]
  end
end
