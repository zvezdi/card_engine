defmodule Engine.Application do
  alias Engine.Room
  alias Engine.RoomManager
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {RoomManager, name: RoomManager}
      # Starts a worker by calling: Engine.Worker.start_link(arg)
      # {Engine.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Engine.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
