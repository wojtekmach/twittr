# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :twittr,
  ecto_repos: [Twittr.Repo]

# Configures the endpoint
config :twittr, TwittrWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "N9kshj/b3bsGvSbcu8ZAAfZvO2kcmwEa+cCbyeBdBfjt0MswM3fRNtwue+g6GDyc",
  render_errors: [view: TwittrWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Twittr.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
