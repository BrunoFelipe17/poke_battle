defmodule PokeBattle.PokeAPI.Client do
  @moduledoc """
    Provides methods to handle informations from PokeAPI using Tesla lib
  """
  use Tesla

  alias PokeBattle.Error

  plug Tesla.Middleware.BaseUrl, "https://pokeapi.co/api/v2/"
  plug Tesla.Middleware.JSON

  @doc """
    Returns all the pokemon informations
  """
  def get_pokemon(pokemon) do
    "pokemon/#{pokemon}"
    |> get()
    |> handle_get(pokemon)
  end

  defp handle_get({:ok, %Tesla.Env{status: 200, body: body}}, _pokemon_name), do: {:ok, body}

  defp handle_get({:ok, %Tesla.Env{status: 404}}, pokemon_name) do
    {:error, Error.pokemon_not_found(pokemon_name)}
  end

  @doc """
    Returns some pokemon informations
  """
  def get_pokemon_informations(pokemon) do
    pokemon_information =
      "pokemon/#{pokemon}"
      |> get()
      |> handle_information()

    {:ok, pokemon_information}
  end

  defp handle_information({:ok, %Tesla.Env{status: 200, body: body}}) do
    %{
      "weight" => body["weight"],
      "height" => body["height"],
      "base_experience" => body["base_experience"]
    }
  end
end
