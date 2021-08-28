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

      {ok, pokemon_info} = File.read("test/pokemon.json")

      expect(ClientMock, :get_pokemon, 2, fn pokemon -> {:ok, pokemon} end)

      response = Create.call(params)

      assert {:ok, %PokeBattle.Battle{pokemon_one: "pikachu", pokemon_two: "charmeleon"}} =
               response
    end
  end
end
