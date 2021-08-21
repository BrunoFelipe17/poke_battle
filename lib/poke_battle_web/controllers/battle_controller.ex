defmodule PokeBattleWeb.BattleController do
  use PokeBattleWeb, :controller

  def index(conn, _) do
    with {:ok, battles} <- PokeBattle.fetch_all_battles() do
      IO.inspect(battles)

      conn
      |> put_status(:ok)
      |> render("index.json", battles: battles)
    end
  end
end
