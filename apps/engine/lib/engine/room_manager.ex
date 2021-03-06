defmodule Engine.RoomManager do
  alias Engine.Room

  use GenServer

  def start_link(arg \\ []) do
    GenServer.start_link(__MODULE__, nil, arg)
  end

  def register(pid \\ __MODULE__, %{name: _name} = room) do
    GenServer.call(pid, {:register, room})
  end

  def list(pid \\ __MODULE__) do
    GenServer.call(pid, :list)
  end

  def deregister(_pid) do
  end

  @impl true
  def init(_) do
    {:ok, %{rooms: []}}
  end

  @impl true
  def handle_call(:list, _from, %{rooms: list} = state), do: {:reply, Enum.map(list, &Room.info/1), state}
  def handle_call({:register, room}, _from, %{rooms: list} = state) do
    {:ok, pid} = Room.Interaction.start_link()
    new_room = Map.put(room, :pid, pid) |> Room.new

    {:reply, :ok, %{state | rooms: [new_room|list]}}
  end

  @impl true
  def handle_cast({:push, item}, state) do
    {:noreply, [item | state]}
  end

end
