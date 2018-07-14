defmodule RoomManagerTest do
  alias Engine.Room
  alias Engine.RoomManager

  use ExUnit.Case
  doctest RoomManager

  test "Register room" do
    {:ok, manager} = RoomManager.start_link
    RoomManager.register(manager, %{name: "Room 42"})

    assert RoomManager.list(manager) == [%{name: "Room 42"}]
  end
end
