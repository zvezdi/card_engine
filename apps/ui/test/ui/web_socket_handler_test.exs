defmodule Ui.WebSocketHandlerTest do
  use ExUnit.Case
  import Ui.WebSocketHandler
  doctest Ui.WebSocketHandler

  # "setup" is called before each test
  setup do
    Application.stop(:engine)
    :ok = Application.start(:engine)
    {:ok, state} = websocket_init(nil)
    [state: state]
  end

  test "Register new room", context do
    request = Poison.encode!(%{action: "register_room", arguments: %{name: "Room 42"}})
    {:reply, {:text, response}, _state} = websocket_handle({:text, request}, context[:state])
    assert Poison.decode!(response) == "ok"
  end

  test "List empty list of rooms", context do
    list_request = Poison.encode!(%{action: "list_rooms"})
    {:reply, {:text, response}, _state} = websocket_handle({:text, list_request}, context[:state])
    assert Poison.decode!(response) == []
  end

  test "List rooms", context do
    request = Poison.encode!(%{action: "register_room", arguments: %{name: "Room 42"}})
    {:reply, _, new_state} = websocket_handle({:text, request}, context[:state])

    list_request = Poison.encode!(%{action: "list_rooms"})
    {:reply, {:text, response} , _state} = websocket_handle({:text, list_request}, new_state)
    assert Poison.decode!(response) == [%{"name" => "Room 42"}]
  end

  test "Websocket request", context do
    request = {:text, "{\"action\": \"list_rooms\"}"}
    {:reply, {:text, response}, _state} = websocket_handle(request, context[:state])
    assert response == "[]"
  end
end
