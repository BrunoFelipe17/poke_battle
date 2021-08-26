defmodule PokeBattle.Battle.Create do
  @moduledoc """
    A module to create battle with two pokemons
  """
  alias PokeBattle.{Battle, Battle.Winner, PokeAPI.Client, Repo}

  @doc """
    Given two valids pokemons, creates a battle
  """
  def call(%{"pokemon_one" => pokemon_one, "pokemon_two" => pokemon_two} = params) do
    winner = Winner.set_winner(pokemon_one, pokemon_two)

    new_params =
      params
      |> Map.put_new("winner", winner)

    changeset = Battle.changeset(new_params)

    with {:ok, %Battle{}} <- Battle.build(changeset),
         {:ok, _} <- Client.get_pokemon(pokemon_one),
         {:ok, _} <- Client.get_pokemon(pokemon_two),
         {:ok, %Battle{}} = battle <- Repo.insert(changeset) do
      battle
    end
  end
end
