defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.case

  import Exlivery.Factory

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Orders.CreateOrUpdate

  describe "call/1" do
    cpf = "12345678900"
    user = build(:user, :cpf = cpf)

    UserAgent.save(user)

    item1 = %{
      category: :pizza,
      description: "Pizza de frango com catupiry",
      quantity: 1,
      unit_price: "42.4"

    }
    item1 = %{
      category: :pizza,
      description: "Pizza de frango com catupiry",
      quantity: 1,
      unit_price: "42.4"

    }

  end
end
