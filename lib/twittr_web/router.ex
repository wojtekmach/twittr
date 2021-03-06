defmodule TwittrWeb.Router do
  use TwittrWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TwittrWeb do
    pipe_through :api
    resources "/statuses", StatusController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
  end
end
