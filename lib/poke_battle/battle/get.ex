defmodule PokeBattle.Battle.Get do
  @moduledoc """
    A module to get the battles from database
  """

  alias PokeBattle.{Battle, Error, Repo}

  @doc """
    List all battles
  """
  def all do
    {:ok, Repo.all(Battle)}
  end

  @doc """
    Return a battle that matches the given id
  """
  def by_id(id) do
    case Repo.get(Battle, id) do
      nil -> {:error, Error.battle_not_found()}
      battle -> {:ok, battle}
    end
  rescue
    Ecto.Query.CastError -> {:error, Error.build(:bad_request, "Invalid UUID")}
  end
end
