defmodule TwittrWeb.UserController do
  use TwittrWeb, :controller

  alias Twittr
  alias Twittr.User

  action_fallback TwittrWeb.FallbackController

  def index(conn, _params) do
    users = Twittr.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Twittr.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Twittr.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Twittr.get_user!(id)

    with {:ok, %User{} = user} <- Twittr.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Twittr.get_user!(id)
    with {:ok, %User{}} <- Twittr.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
