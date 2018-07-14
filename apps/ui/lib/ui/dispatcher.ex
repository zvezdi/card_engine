defmodule Ui.Dispatcher do
  def dispatch do
    [
      {:_,
       [
         {"/ws", Ui.WebSocketHandler, []},
         {:_, Plug.Adapters.Cowboy2.Handler, {Ui.Router, []}}
       ]}
    ]
  end
end
