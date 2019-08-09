defmodule TodoApiWeb.Router do
  use TodoApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TodoApiWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/todos", TodoController, except: [:new, :edit]
  end

  pipeline :browser do
    plug(:accepts, ["html"])
  end

  scope "/", TodoApiWeb do
    pipe_through :browser
    get "/", DefaultController, :index
  end
end
