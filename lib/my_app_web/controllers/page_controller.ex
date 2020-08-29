defmodule MyAppWeb.PageController do
  use MyAppWeb, :controller

  plug MyAppWeb.DoNothingPlug
  plug :do_nothing

  def index(conn, _params) do
    render(conn, "index.html")
    # |> IO.inspect()
  end

  defp do_nothing(conn, _opts) do
    IO.puts("""
    =========================
    Function Plug: do_nothing
    =========================
    """)

    conn
  end
end
