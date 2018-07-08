defmodule Ui.WebSocketHandler do
  @behaviour :cowboy_websocket

  def init(request, state) do
    {:cowboy_websocket, request, state}
  end

  def websocket_init(state) do
    {:ok, session} = Session.start_link()
    {:ok, %{session: session}}
  end

  def websocket_handle({:text, message}, state) do
    decoded_json = Poison.decode!(message)
    case websocket_handle({:json, decoded_json}, state) do
      {:reply, data, state} -> {:reply, {:text, data}, state}
      {:reply_json, data, state} -> {:reply, {:text, Poison.encode!(jsonify(data), pretty: true)}, state}
    end
  end

  def websocket_handle({:json, %{"action" => "list_rooms"}}, %{session: session} = state) do
    {:reply_json, Session.list_rooms(session), state}
  end

  def websocket_handle({:json, %{"action" => "register_room", "arguments" => %{"name" => name}}},
                      %{session: session} = state) do
    {:reply_json, Session.register_room(session, %{name: name}), state}
  end

  def websocket_info(info, state) do
    {:reply, state}
  end

  def terminate(_reason, _request, _state) do
    :ok
  end

  @doc """
  Transform symbol to stings in a dict recursively
  """
  def jsonify(data) when is_map(data) do
    Enum.map(data, fn({key, value}) -> {jsonify(key), jsonify(value)} end) |> Map.new
  end
  def jsonify(data) when is_list(data), do:  Enum.map(data, &jsonify/1)
  def jsonify(data) when is_atom(data), do: Atom.to_string(data)
  def jsonify(data), do: data
end
