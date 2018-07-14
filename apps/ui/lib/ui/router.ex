defmodule Ui.Router do
  use Plug.Router

  # Replace "/" with "/index.html"
  plug Plug.Static.IndexHtml, at: "/"
  plug Plug.Static, at: "/", from: {:ui, "priv/static"}
  plug(:match)
  plug(:dispatch)

  def start_link do
    Plug.Adapters.Cowboy2.http(Ui.Router, [])
  end

  get "/foo" do
    conn
    |> send_resp(200, "Yey!")
  end
end
