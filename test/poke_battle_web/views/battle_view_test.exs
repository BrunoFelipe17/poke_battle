defmodule PokeBattleWeb.BattleViewTest do
  use PokeBattleWeb.ConnCase, async: true

  import Phoenix.View
  alias PokeBattle.{Battle, Repo}

  alias PokeBattleWeb.BattleView

  test "renders create.json" do
    id = "895218c6-8461-47fd-b346-3e1d43641b6f"

    response = render(BattleView, "create.json", id: id)

    assert %{message: "Battle created"} = response
  end
end
