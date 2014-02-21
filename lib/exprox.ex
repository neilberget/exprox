defmodule Exprox do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    dispatch = :cowboy_router.compile([
                 {:_, [{:_, Exprox.ProxyHandler, []}]}
               ])

    {:ok, _} = :cowboy.start_http(:http, 100,
                                  [port: 8080],
                                  [env: [dispatch: dispatch]])

    Exprox.Supervisor.start_link
  end
end
