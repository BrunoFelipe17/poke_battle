defmodule PokeBattle.CreateTest do
  use PokeBattle.DataCase, async: true

  import PokeBattle.Factory
  import Mox

  alias PokeBattle.Battle.Create
  alias PokeBattle.PokeAPI.ClientMock

  describe "call/1" do
    test "when all params are valid, returns the battle" do
      params = build(:pokemon)
      IO.inspect(params)

      expect(ClientMock, :get_pokemon, fn _pokemon -> nil end)
      response = Create.call(params)

      assert response == "Leozinho"
    end
  end
end
