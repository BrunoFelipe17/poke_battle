defmodule PokeBattleWeb.BattleView do
  use PokeBattleWeb, :view

  def render("index.json", %{battles: battles}), do: %{"battles" => battles}
end
