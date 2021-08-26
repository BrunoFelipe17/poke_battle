defmodule PokeBattleWeb.BattleController do
  use PokeBattleWeb, :controller

  alias PokeBattleWeb.FallbackController

  action_fallback FallbackController

  def index(conn, _) do
    with {:ok, battles} <- PokeBattle.fetch_all_battles() do
      conn
      |> put_status(:ok)
      |> render("index.json", battles: battles)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %PokeBattle.Battle{pokemon_one: pokemon_one, pokemon_two: pokemon_two} = battle} <-
           PokeBattle.fetch_by_id(id),
         {:ok, pokemon_one_info} <-
           PokeBattle.pokemon_infos(pokemon_one),
         {:ok, pokemon_two_info} <-
           PokeBattle.pokemon_infos(pokemon_two) do
      conn
      |> put_status(:ok)
      |> render("show.json",
        battle: battle,
        pokemon_one_info: pokemon_one_info,
        pokemon_two_info: pokemon_two_info
      )
    end
  end

  def create(conn, params) do
    with {:ok, %PokeBattle.Battle{id: id}} <- PokeBattle.create_battle(params) do
      conn
      |> put_status(:created)
      |> render("create.json", id: id)
    end
  end
end
