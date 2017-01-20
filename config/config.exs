# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :weeks_of_making,
  ecto_repos: [WeeksOfMaking.Repo]

# Configures the endpoint
config :weeks_of_making, WeeksOfMaking.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "C9mVoXeIBAvycqLUDoGSdJDpTUtvKEEgnjZx/UvKlzQ3E4XgW7nbgI5OrQ5gNhF8",
  render_errors: [view: WeeksOfMaking.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WeeksOfMaking.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :ueberauth, Ueberauth,
  providers: [
    facebook: { Ueberauth.Strategy.Facebook, [profile_fields: "name,email"] }
  ]

config :ueberauth, Ueberauth.Strategy.Facebook.OAuth,
  client_id: System.get_env("FACEBOOK_CLIENT_ID"),
  client_secret: System.get_env("FACEBOOK_CLIENT_SECRET")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
