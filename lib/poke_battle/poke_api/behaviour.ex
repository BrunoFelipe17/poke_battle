defmodule PokeBattle.PokeAPI.Behaviour do
  @callback get_pokemon(String.t()) :: {:ok, map()} | {:error, PokeBattle.Error.t()}
end
