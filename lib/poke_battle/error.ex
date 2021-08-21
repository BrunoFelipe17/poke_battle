defmodule PokeBattle.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def pokemon_not_found, do: build(:not_found, "Pokemon not found")
  def battle_not_found, do: build(:not_found, "Battle not found")
end
