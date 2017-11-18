defmodule Twittr.Repo.Migrations.CreateStatuses do
  use Ecto.Migration

  def change do
    create table(:statuses) do
      add :text, :text

      timestamps()
    end

  end
end
