defmodule PokeBattle.Battle.Get do
  alias PokeBattle.{Battle, Error, Repo}

  def all() do
    Repo.all(Battle)
  end

  def by_id(id) do
    case Repo.get(Battle, id) do
      nil -> {:error, Error.battle_not_found()}
      battle -> {:ok, battle}
    end
  rescue
    Ecto.Query.CastError -> {:error, Error.build(:bad_request, "Invalid UUID")}
  end
end
