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
    setup do
      UserAgent.start_link(%{})

      cpf = "12345678990"

      {:ok, cpf: cpf}
    end

    test "When the user is found, return the user" , %{cpf: cpf} do

      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

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

      :user
      |> build(cpf: "12345678990")
      |> UserAgent.save()

      response = UserAgent.get("123456789")

      assert response == {:error, "User not found"}
    end
  end
end
