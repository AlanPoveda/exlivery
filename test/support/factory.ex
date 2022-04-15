defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Alan",
      email: "Alan@poveda.com",
      cpf: "12345678900",
      age: 26,
      address: "Rua opa 23"
    }
  end
end
