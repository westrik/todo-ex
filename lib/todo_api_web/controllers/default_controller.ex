defmodule TodoApiWeb.DefaultController do
  use TodoApiWeb, :controller

  def index(conn, _params) do
    text conn, "hello this is todo api"
  end
end