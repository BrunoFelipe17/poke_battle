defmodule PokeBattle.Battle do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:pokemon_one, :pokemon_two]

  @derive {Jason.Encoder, only: @required_params ++ [:id, :winner]}

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
