defmodule TwittrWeb.StatusController do
  use TwittrWeb, :controller

  alias Twittr
  alias Twittr.Status

  action_fallback TwittrWeb.FallbackController

  def index(conn, _params) do
    statuses = Twittr.list_statuses()
    render(conn, "index.json", statuses: statuses)
  end

  def create(conn, %{"status" => status_params}) do
    with {:ok, %Status{} = status} <- Twittr.create_status(status_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", status_path(conn, :show, status))
      |> render("show.json", status: status)
    end
  end

  def show(conn, %{"id" => id}) do
    status = Twittr.get_status!(id)
    render(conn, "show.json", status: status)
  end

  def update(conn, %{"id" => id, "status" => status_params}) do
    status = Twittr.get_status!(id)

    with {:ok, %Status{} = status} <- Twittr.update_status(status, status_params) do
      render(conn, "show.json", status: status)
    end
  end

  def delete(conn, %{"id" => id}) do
    status = Twittr.get_status!(id)
    with {:ok, %Status{}} <- Twittr.delete_status(status) do
      send_resp(conn, :no_content, "")
    end
  end
end
