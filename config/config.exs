# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :weeksofmaking,
  ecto_repos: [Weeksofmaking.Repo]

# Configures the endpoint
config :weeksofmaking, Weeksofmaking.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "C9mVoXeIBAvycqLUDoGSdJDpTUtvKEEgnjZx/UvKlzQ3E4XgW7nbgI5OrQ5gNhF8",
  render_errors: [view: Weeksofmaking.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Weeksofmaking.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
