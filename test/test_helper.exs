ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(PokeBattle.Repo, :manual)

Mox.defmock(PokeBattle.PokeAPI.ClientMock, for: PokeBattle.PokeAPI.Behaviour)
