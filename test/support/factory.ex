defmodule PokeBattle.Factory do
  use ExMachina.Ecto, repo: PokeBattle.Repo

  def pokemon_factory do
    %{"pokemon_one" => "pikachu", "pokemon_two" => "charmeleon"}
  end
end
