defmodule MyAppWeb.Auth.OnlyAdmin do
  import Phoenix.Controller, only: [redirect: 2]
  import Plug.Conn, only: [halt: 1]

  def init(opts), do: opts

  def call(conn, _opts) do
    if admin?(conn) do
      conn
    else
      IO.puts("""
      =======================
      Module Plug: only_admin
      =======================
      """)

      conn
      |> redirect(external: "https://www.phoenixframework.org/")
      |> halt()
    end
  end

  defp admin?(_conn) do
    # 本筋から外れるので省略しますが、本来はここに管理者判定ロジックを書きます
    false
  end
end
