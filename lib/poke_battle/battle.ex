defmodule PokeBattle.Battle do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:pokemon_one, :pokemon_two]

  schema "poke_battle" do
    field :pokemon_one, :string
    field :pokemon_two, :string
    field :winner, :string

    timestamps()
  end

  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
