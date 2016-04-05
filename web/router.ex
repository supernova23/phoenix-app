defmodule Chat2.Router do
  use Chat2.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Chat2 do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/register", UserController, :new
    resources "/users", UserController do
      resources "/posts", PostController
    end
    get "/login", SessionController, :login
    resources "/sessions", SessionController, only: [:create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Chat2 do
  #   pipe_through :api
  # end
end
