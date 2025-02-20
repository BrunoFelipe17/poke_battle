defmodule PokeBattleWeb.FallbackController do
  use PokeBattleWeb, :controller

  alias PokeBattle.Error
  alias PokeBattleWeb.ErrorView

  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
