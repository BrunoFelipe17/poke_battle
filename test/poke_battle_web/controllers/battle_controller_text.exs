defmodule PokeBattleWeb.BattleControllerTest do
  use PokeBattleWeb.ConnCase, async: true

  import Mox

  alias PokeBattle.PokeAPI.ClientMock

  describe "create/2" do
    test "when all params are valid, creates a battle", %{conn: conn} do
      params = %{
        "pokemon_one" => "hypno",
        "pokemon_two" => "scyther"
      }

      expect(ClientMock, :get_pokemon, 2, fn pokemon -> {:ok, pokemon} end)

      response =
        conn
        |> post(Routes.battle_path(conn, :create, params))
        |> json_response(:created)

      assert %{"message" => "Battle created"} = response
    end
  end
end
