defmodule TodoApiWeb.Router do
  use TodoApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug TodoApiWeb.Auth.Pipeline
  end

  scope "/api", TodoApiWeb do
    pipe_through :api
    post "/users/signup", UserController, :create
    post "/users/signin", UserController, :signin
  end

  scope "/api", TodoApiWeb do
    pipe_through [:api, :auth]
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
