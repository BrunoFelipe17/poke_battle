defmodule PokeBattle.PokeAPI.ClientTest do
  use ExUnit.Case, async: true

  alias PokeBattle.PokeAPI.Client

  describe "get_pokemon/1" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "when there is a valid pokemon name/id, returns the pokemon info", %{bypass: bypass} do
      pokemon = "pikachu"

      url = endpoint_url(bypass.port)

      {:ok, body} = File.read("test/pikachu.json")

      Bypass.expect(bypass, "GET", "#{pokemon}", fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response = Client.get_pokemon(url, pokemon)

      assert {:ok, %{"name" => "pikachu"}} = response
    end

    test "when there is a invalid pokemon name/id, returns a 404 error", %{bypass: bypass} do
      pokemon = "Bruno"

      url = endpoint_url(bypass.port)

      Bypass.expect(bypass, "GET", "#{pokemon}", fn conn ->
        Plug.Conn.resp(conn, 404, "")
      end)

      response = Client.get_pokemon(url, pokemon)

      # expected_response = {:error, Error.pokemon_not_found(pokemon_name)}

      {:error, %PokeBattle.Error{result: "Pokemon '#{pokemon}' not found", status: :not_found}}
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"
end
