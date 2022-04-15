defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  describe "build/5" do
    test "When all params are valid, returns the user" do
      response =
        User.build(
          "Alan",
          "alan@poveda.com",
          "12345678900",
          26,
          "Rua Opa"
        )

      expected_response =
        {:ok,
         %Exlivery.Users.User{
           address: "Rua Opa",
           age: 26,
           cpf: "12345678900",
           email: "alan@poveda.com",
           name: "Alan"
         }}

      assert response == expected_response
    end

    test "When the age is less than 18 inputs, return a error" do
      response =
        User.build(
          "Alan Menor",
          "alan@poveda.com",
          "12345678900",
          16,
          "Rua Opa"
        )

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
