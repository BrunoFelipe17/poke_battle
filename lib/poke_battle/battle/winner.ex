defmodule PokeBattle.Battle.Winner do
  @moduledoc """
    A module to set the pokemon winner from the battle
  """

  @doc """
    Randomly generate a winner
  """
  def set_winner(pokemon_one, pokemon_two) do
    random_number = :rand.uniform(10)
    winner = random_winner(pokemon_one, pokemon_two, random_number)
    winner
  end

  defp random_winner(pokemon_one, _pokemon_two, n) when is_integer(n) and n < 5 do
    pokemon_one
  end

  defp random_winner(_pokemon_one, pokemon_two, n) when is_integer(n) do
    pokemon_two
  end
end
