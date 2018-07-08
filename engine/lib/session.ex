defmodule Session do
  alias Engine.RoomManager
  use GenServer

  def start_link(arg \\ []) do
    GenServer.start_link(__MODULE__, nil, arg)
  end

  def register_room(_session, args) do
    RoomManager.register(args)
  end

  def list_rooms(_session) do
    RoomManager.list
  end

  @impl true
  def init(_) do
    {:ok, %{}}
  end

end
