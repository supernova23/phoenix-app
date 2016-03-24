defmodule Chat2.LayoutView do
  use Chat2.Web, :view

  def current_user(conn) do
    Plug.Conn.get_session(conn, :current_user)
  end
end
