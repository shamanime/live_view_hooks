# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :live_view_hooks,
  ecto_repos: [LiveViewHooks.Repo]

# Configures the endpoint
config :live_view_hooks, LiveViewHooksWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o6etJoAfGX3LT3gxR9s9p6Yix78ORm3+O8YK1B6f7THqe9npovoFzwRu/tUAGyW8",
  render_errors: [view: LiveViewHooksWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: LiveViewHooks.PubSub,
  live_view: [signing_salt: "rYHLbQLK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
