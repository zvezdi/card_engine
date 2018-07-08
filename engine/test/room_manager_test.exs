defmodule RoomManagerTest do
  use ExUnit.Case
  doctest RoomManager

  test "Register room" do
    {:ok, manager} = RoomManager.start_link
    RoomManager.register(manager, %{name: "Room 42"})

    [%Room{name: "Room 42", pid: room_42_pid}] = RoomManager.list(manager)
    assert Process.alive? room_42_pid
  end
end
