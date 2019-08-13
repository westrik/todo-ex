defmodule TodoApi.Repo.Migrations.AddLoginUniqueConstraint do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:login])
  end
end
