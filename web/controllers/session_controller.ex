defmodule Chat2.SessionController do
	use Chat2.Web, :controller

	alias Chat2.Session

	def login(conn, _params) do
		render(conn, "login.html")
	end

	def create(conn, params = %{"username" => username, "password" => password}) do
		render(conn, "login.html", params: params)
	end
end