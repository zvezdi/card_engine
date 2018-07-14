defmodule Ui.Router do
  use Plug.Router


  if Mix.env == :dev do
    forward "/", to: ReverseProxy, upstream: ["localhost:8000"]
  else
    # Replace "/" with "/index.html"
    # use nginx for real production
    plug Plug.Static.IndexHtml, at: "/"
    plug Plug.Static, at: "/", from: {:ui, "priv/static"}
  end

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
