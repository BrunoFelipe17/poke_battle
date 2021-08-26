defmodule PokeBattle.Error do
  @moduledoc """
    A module to handle errors in the application
  """
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  @doc """
    Create an error with the status and a message
  """
  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  @doc """
    Returns an error when the pokemon is not found
  """
  def pokemon_not_found(pokemon_name) do
    build(:not_found, "Pokemon '#{pokemon_name}' not found")
  end

  @doc """
    Returns an error when the battle is not found
  """
  def battle_not_found, do: build(:not_found, "Battle not found")
end
