defmodule PokeBattle do
  alias PokeBattle.Battle.Create, as: CreateBattle
  alias PokeBattle.Battle.Get, as: GetBattle
  alias PokeBattle.PokeAPI.Client

  @moduledoc """
  PokeBattle keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  defdelegate fetch_all_battles, to: GetBattle, as: :all
  defdelegate fetch_by_id(id), to: GetBattle, as: :by_id
  defdelegate create_battle(params), to: CreateBattle, as: :call
  defdelegate pokemon_infos(pokemon_name), to: Client, as: :get_pokemon_informations
end
