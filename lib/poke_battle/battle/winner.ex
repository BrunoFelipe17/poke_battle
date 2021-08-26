defmodule PokeBattle.Battle.Winner do
  def set_winner(pokemon_one, pokemon_two) do
    winner =
      if :rand.uniform(10) <= 5 do
        pokemon_one
      else
        pokemon_two
      end

    winner
  end
end
