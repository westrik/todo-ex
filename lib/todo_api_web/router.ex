defmodule TodoApiWeb.Router do
  use TodoApiWeb, :router

  pipeline :api do
    plug CORSPlug, origin: "*" # TODO: restrict this
    plug :accepts, ["json"]
  end

  scope "/api", TodoApiWeb do
    pipe_through :api
    get "/users", UserController, :index
    get "/todos", TodoController, :index
    get "/todos/:id", TodoController, :show
    post "/todos", TodoController, :create
  end

  pipeline :browser do
    plug CORSPlug, origin: "*" # TODO: restrict this
    plug(:accepts, ["html"])
  end

  scope "/", TodoApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end
