defmodule Ui.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  def start_link do
    Plug.Adapters.Cowboy2.http(Ui.Router, [])
  end

  get "/" do
    conn
    |> send_resp(200, "Yey!")
  end
end
