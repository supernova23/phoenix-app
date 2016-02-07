defmodule Todo.MyController do
	use Todo.Web, :controller

	def index(conn, _params) do
		render conn, "index.html"
	end

	def show(conn, params) do
		%{ "message"=> message } = params
		case params do
		  %{ "age"=> age } ->
		  	render conn, "show.html", message: message, age: age
		  _ ->
		  	render conn, "show.html", message: message
		end
	end
end