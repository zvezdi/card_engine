defmodule Engine.Room do
  alias Engine.Room
@moduledoc """
Representation of the room entity
"""
  defstruct name: "Name me", pid: nil

  def new(%{name: name, pid: pid}) do
    %Room{name: name, pid: pid}
  end

  def info(%Room{name: name} = room) do
    %{name: name}
  end
end
