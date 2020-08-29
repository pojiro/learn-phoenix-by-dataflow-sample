defmodule MyAppWeb.DoNothingPlug do
  def init(opts) do
    IO.puts("""
    ========================================
    Module Plug: MyAppWeb.DoNothingPlug init
    ========================================
    """)

    opts
  end

  def call(conn, _opts) do
    IO.puts("""
    ========================================
    Module Plug: MyAppWeb.DoNothingPlug call
    ========================================
    """)

    conn
  end
end
