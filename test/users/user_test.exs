defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "When all params are valid, returns the user" do
      response =
        User.build(
          "Alan",
          "Alan@poveda.com",
          "12345678900",
          26,
          "Rua opa 23"
        )

      expected_response = {:ok, build(:user)}

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
