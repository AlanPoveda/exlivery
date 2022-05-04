defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case
  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "When all params are valid, saves the user" do
      params = %{
        name: "Alan",
        email: "alan@poveda.com",
        cpf: "12345678900",
        age: 26,
        address: "Rua test 123"
      }

      expected = CreateOrUpdate.call(params)

      expected_response = {:ok, "User Created"}

      assert expected == expected_response

    end

    test "When invalid params, return a error" do
      params = %{
        name: "Alan",
        email: "alan@poveda.com",
        cpf: "12345678900",
        age: 5,
        address: "Rua test 123"
      }

      expected = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert expected == expected_response
    end
  end
end
