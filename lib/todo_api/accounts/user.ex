defmodule TodoApi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :login, :string
    field :name, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :login, :password])
    |> validate_required([:name, :login, :password])
    |> validate_length(:password, min: 6)
    |> unique_constraint(:login)
    |> put_hashed_password
  end

  defp put_hashed_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}}
      ->
        put_change(changeset, :encrypted_password, Bcrypt.hash_pwd_salt(password))
      _ ->
        changeset
    end
  end
end
