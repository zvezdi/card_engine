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
    # json = Poison.decode!(message)
    # websocket_handle({:json, json}, state)
    {:reply, {:text, "pong"}, state}
  end

  # def websocket_handle({:json, _}, state) do
  #     {:reply, {:text, "hello world"}, state}
  # end

  def websocket_info(info, state) do
    {:reply, state}
  end

  def terminate(_reason, _request, _state) do
    :ok
  end
end
