defmodule PokeBattle.Repo.Migrations.PokeBattleTable do
  use Ecto.Migration

  def change do
    create table(:poke_battle, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :pokemon_one, :string
      add :pokemon_two, :string
      add :winner, :string

      timestamps()
    end
  end
end
