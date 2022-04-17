defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Users.User
  alias Exlivery.Orders.Item

  def user_factory do
    %User{
      name: "Alan",
      email: "Alan@poveda.com",
      cpf: "12345678900",
      age: 26,
      address: "Rua opa 23"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de frango com catupiri",
      category: :pizza,
      unit_price: Decimal.new("23.3"),
      quantity: 1
    }
  end

end
