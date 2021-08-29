defmodule PokeBattle.BattleTest do
  use PokeBattle.DataCase, async: true

  import PokeBattle.Factory

  alias PokeBattle.Battle

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:pokemon)

      response = Battle.changeset(params)

      assert %Ecto.Changeset{valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = %{"pokemon_one" => "pikachu"}

      response = Battle.changeset(params)

      expected_response = %{pokemon_two: ["can't be blank"], winner: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
