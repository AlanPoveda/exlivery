defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent

  import Exlivery.Factory

  describe "save/1" do
    test "save a user" do
      user = build(:user)

      UserAgent.start_link(%{})

      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    test "When the user is found, return the user" do
      UserAgent.start_link(%{})

      :user
      |> build(cpf: "12345678990")
      |> UserAgent.save()

      response = UserAgent.get("12345678990")

      assert response ==
               {:ok,
                %Exlivery.Users.User{
                  address: "Rua opa 23",
                  age: 26,
                  cpf: "12345678990",
                  email: "Alan@poveda.com",
                  name: "Alan"
                }}
    end

    test "When the user is not found, return a error message" do
      UserAgent.start_link(%{})

      :user
      |> build(cpf: "12345678990")
      |> UserAgent.save()

      response = UserAgent.get("123456789")

      assert response == {:error, "User not found"}
    end
  end
end
