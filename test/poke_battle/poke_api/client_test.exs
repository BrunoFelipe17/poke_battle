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

      expected_response =
        {:error, %PokeBattle.Error{result: "Pokemon '#{pokemon}' not found", status: :not_found}}

      assert response == expected_response
    end
  end

  describe "get_pokemon_informations/1" do
    setup do
      bypass = Bypass.open()

      {:ok, bypass: bypass}
    end

    test "when there is a valid pokemon name/id, returns the weight, height, base_experience",
         %{bypass: bypass} do
      pokemon = "pikachu"

      url = endpoint_url(bypass.port)

      body = ~s({"weight": 60, "height": 4, "base_experience": 112})

      Bypass.expect(bypass, "GET", "#{pokemon}", fn conn ->
        conn
        |> Plug.Conn.put_resp_header("content-type", "application/json")
        |> Plug.Conn.resp(200, body)
      end)

      response = Client.get_pokemon_informations(url, pokemon)

      expected_response = {:ok, %{"base_experience" => 112, "height" => 4, "weight" => 60}}

      assert response == expected_response
    end
  end

  defp endpoint_url(port), do: "http://localhost:#{port}"
end
