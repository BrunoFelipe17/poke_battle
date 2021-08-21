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
    with {:ok, %PokeBattle.Battle{} = battle} <- PokeBattle.fetch_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("show.json", battle: battle)
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
