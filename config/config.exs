# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :todo_api,
  ecto_repos: [TodoApi.Repo]

# Configures the endpoint
config :todo_api, TodoApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UFn3omKOwY+yjy2XmH1M5co2FFd8izWRUg1K5KEvpWlW3fT8vFqRtyHNYyRXg/j5",
  render_errors: [view: TodoApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: TodoApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

#
config :todo_api, TodoApiWeb.Auth.Guardian,
       issuer: "todo_api",
       # TODO: load this from environment
       secret_key: "HYYYivliMyiRELDNEslzbH5gOqohvPv6vwMuhG5y/kU44S2eG07KnE62AI77nwRD"
