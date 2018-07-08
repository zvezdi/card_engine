defmodule Engine.Room.Interaction do
  use GenServer

  def start_link(arg \\ []) do
    GenServer.start_link(__MODULE__, nil, arg)
  end

  def init(_) do
    {:ok, %{}}
  end
end
