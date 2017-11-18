defmodule TwittrWeb.Router do
  use TwittrWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TwittrWeb do
    pipe_through :api
  end
end
