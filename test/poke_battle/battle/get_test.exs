defmodule PokeBattle.Battle.GetTest do
  use PokeBattle.DataCase, async: true

  alias PokeBattle.{Battle, Battle.Get, Repo}

  describe "by_id/1" do
    setup do
      {_ok, battle1} = Repo.insert(%Battle{pokemon_one: "pikachu", pokemon_two: "charmander"})
      %{battle: battle1}
    end

    test "return a battle with the given id", %{battle: battle} do
      assert {:ok, %Battle{}} = Get.by_id(battle.id)
    end

    test "return an error when a battle is not found" do
      random_uuid = "895218c6-8461-47fd-b346-3e1d43641b6f"

      response = Get.by_id(random_uuid)

      expected_response =
        {:error, %PokeBattle.Error{result: "Battle not found", status: :not_found}}

      assert response == expected_response
    end

    test "return an error when the uuid is invalid" do
      invalid_uuid = "123"

      response = Get.by_id(invalid_uuid)

      expected_response =
        {:error, %PokeBattle.Error{result: "Invalid UUID", status: :bad_request}}

      assert response == expected_response
    end
  end
end
