defmodule PokeBattle.PokeAPI.Client do
  use Tesla

  alias PokeBattle.Error

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2/"
  plug Tesla.Middleware.JSON

  def get_pokemon(id_or_name) do
    "pokemon/#{id_or_name}"
    |> get()
    |> handle_get()
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}), do: {:ok, body}
  defp handle_get({:ok, %Tesla.Env{status: 404}}), do: {:error, Error.pokemon_not_found()}
end
