defmodule Twittr do
  @moduledoc """
  Twittr keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  import Ecto.Query, warn: false
  alias Twittr.Repo

  # Stauses
  alias Twittr.Status

  def list_statuses do
    Repo.all(Status)
  end

  def get_status!(id), do: Repo.get!(Status, id)

  def create_status(attrs \\ %{}) do
    %Status{}
    |> Status.changeset(attrs)
    |> Repo.insert()
  end

  def update_status(%Status{} = status, attrs) do
    status
    |> Status.changeset(attrs)
    |> Repo.update()
  end

  def delete_status(%Status{} = status) do
    Repo.delete(status)
  end

  def change_status(%Status{} = status) do
    Status.changeset(status, %{})
  end

  # Users
  alias Twittr.User

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
