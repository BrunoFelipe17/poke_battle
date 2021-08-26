defmodule PokeBattleWeb.BattleView do
  use PokeBattleWeb, :view

  def render("index.json", %{battles: battles}), do: %{"battles" => battles}

  def render("show.json", %{
        battle: %{pokemon_one: pokemon_one, pokemon_two: pokemon_two} = battle,
        pokemon_one_info: pokemon_one_info,
        pokemon_two_info: pokemon_two_info
      }) do
    %{
      "battle" => %{
        "fighter_one" => %{"name" => pokemon_one, "infos" => pokemon_one_info},
        "fighter_two" => %{"name" => pokemon_two, "infos" => pokemon_two_info},
        "winner" => battle.winner
      }
    }
  end

  def render("create.json", %{id: id}) do
    %{
      message: "Battle created",
      id: id
    }
  end
end
