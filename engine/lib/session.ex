defmodule Session do
  use GenServer

  def start_link(arg \\ []) do
    GenServer.start_link(__MODULE__, arg)
  end

  def register_room(args) do
    RoomManager.register(args)
  end

  def list_rooms() do
    RoomManager.list
  end

  @impl true
  def init(_) do
    {:ok, %{}}
  end

end
