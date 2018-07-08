defmodule Room do
@moduledoc """
Representation of the room entity
"""
  defstruct name: "Name me", pid: nil

  def new(%{name: name, pid: pid}) do
    %Room{name: name, pid: pid}
  end
end
