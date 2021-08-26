defmodule PokeBattle.Battle do
  @moduledoc """
    A module to create Battle schema and changeset
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:pokemon_one, :pokemon_two, :winner]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "poke_battle" do
    field :pokemon_one, :string
    field :pokemon_two, :string
    field :winner, :string

    timestamps()
  end

  def build(changeset), do: apply_action(changeset, :create)

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
