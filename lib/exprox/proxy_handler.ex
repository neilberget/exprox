defmodule Exprox.ProxyHandler do
  def init(_transport, req, []) do
    {:ok, req, nil}
  end

  def handle(req, state) do
    {method, req} = :cowboy_req.method(req)
    {path, req} = :cowboy_req.path(req)
    IO.puts "Path: "
    IO.puts path
    {:ok, req} = proxy(method, req, path)
    {:ok, req, state}
  end

  def proxy("GET", req, path) do
    body = ProxyClient.get("http://mayo.dev/" <> path).body
    content_type = "TODO: detect from response, and set in reply"
    :cowboy_req.reply(200, [{"content-type", "text/html; charset=utf-8"}], body, req)
  end

  def terminate(_reason, _req, _state), do: :ok

end
