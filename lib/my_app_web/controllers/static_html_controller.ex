defmodule MyAppWeb.StaticHTMLController do
  use MyAppWeb, :controller

  plug Plug.Static,
    # 静的HTMLの配信パス
    at: "/static",
    # 静的HTMLの保存ディレクトリ
    from: {:my_app, "priv/static_html"},
    # HTML以外のリソースを記述
    only: ~w(css)

  def index(conn, _params) do
    IO.inspect("inside index")
    # "/static/hello/world.html" へのGETリクエストの場合
    # conn.params["path"] は ["hello", "world.html"] となっています。
    html_path = Enum.join(["priv/static_html" | conn.params["path"]], "/")

    case File.read(html_path) do
      {:ok, data} ->
        html(conn, data)

      _ ->
        conn
        |> put_status(:not_found)
        |> put_view(MyAppWeb.ErrorView)
        # render built-in 404.html
        |> render(:"404")
    end
  end
end
