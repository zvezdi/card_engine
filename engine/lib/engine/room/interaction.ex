defmodule Engine.Room.Interaction do
  use GenServer

  def start_link(arg \\ []) do
    GenServer.start_link(__MODULE__, arg)
  end

  def init(_) do
    {:ok, %{}}
  end
end
