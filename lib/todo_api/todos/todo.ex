defmodule TodoApi.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :description, :string
    field :is_complete, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:description, :is_complete])
    |> validate_required([:description, :is_complete])
  end
end
