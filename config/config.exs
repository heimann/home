# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :home, HomeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dID+bUlPPTdG1Tlxz5r2OzmIc1hBForApEAUNXt3dC2ZlrirrSPBkvEyNQyzRPNP",
  render_errors: [view: HomeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Home.PubSub,
  live_view: [signing_salt: "IFzsmAIU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Use Hackney with Tesla
config :tesla, adapter: Tesla.Adapter.Hackney

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
