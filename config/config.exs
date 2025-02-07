# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :poke_battle,
  ecto_repos: [PokeBattle.Repo]

config :poke_battle, PokeBattle.Battle.Create, poke_api_adapter: PokeBattle.PokeAPI.Client

# Configures the endpoint
config :poke_battle, PokeBattleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6bgU1tRWtDCyIKMOgWFbza+W6k+XBm42lJMcJdX0mEvwao7l7PQd8PxFKmeSXen3",
  render_errors: [view: PokeBattleWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: PokeBattle.PubSub,
  live_view: [signing_salt: "m+8qu7Pr"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :tesla, adapter: Tesla.Adapter.Hackney

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
