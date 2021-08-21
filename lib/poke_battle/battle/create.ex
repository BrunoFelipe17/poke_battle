defmodule PokeBattle.Battle.Create do
  alias PokeBattle.{Battle, PokeAPI.Client, Repo}

  def call(%{"pokemon_one" => pokemon_one, "pokemon_two" => pokemon_two} = params) do
    changeset = Battle.changeset(params)

    with {:ok, %Battle{}} <- Battle.build(changeset),
         {:ok, %{"name" => _name}} <- Client.get_pokemon(pokemon_one),
         {:ok, %{"name" => _name}} <- Client.get_pokemon(pokemon_two),
         {:ok, %Battle{}} = battle <- Repo.insert(changeset) do
      battle
    end
  end
end
