defmodule TodoApiWeb.UserView do
  use TodoApiWeb, :view
  alias TodoApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user, token: token}) do
    %{
      token: token,
      name: user.name,
      login: user.login,
    }
  end
end
