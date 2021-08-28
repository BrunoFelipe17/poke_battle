defmodule PokeBattle.Battle.GetTest do
  use PokeBattle.DataCase, async: true

  alias PokeBattle.{Battle, Battle.Get, Repo}

  describe "all/1" do
    setup do
      {_ok, battle1} = Repo.insert(%Battle{pokemon_one: "pikachu", pokemon_two: "charmander"})
      {_ok, battle2} = Repo.insert(%Battle{pokemon_one: "charizard", pokemon_two: "blastoise"})
      %{battles: [battle1, battle2]}
    end

    test "returns all battles", %{battles: battles} do
      battle1 = Enum.at(battles, 0)
      battle2 = Enum.at(battles, 1)

      # assert "a" == "b"
      assert {:ok, battle1} == Get.by_id(battle1.id)
      assert {:ok, battle2} == Get.by_id(battle2.id)
    end
  end

  describe "by_id/1" do
    setup do
      {_ok, battle1} = Repo.insert(%Battle{pokemon_one: "pikachu", pokemon_two: "charmander"})
      %{battle: battle1}
    end

    test "return a battle with the given id", %{battle: battle} do
      assert {:ok, %Battle{}} = Get.by_id(battle.id)
    end
  end
end
