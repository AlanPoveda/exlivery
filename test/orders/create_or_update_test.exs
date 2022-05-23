defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      cpf = "12345678900"
      user = build(:user, cpf: cpf)

      Exlivery.start_agents()
      UserAgent.save(user)

      item1 = %{
        category: :pizza,
        description: "Pizza de frango com catupiry",
        quantity: 1,
        unit_price: "42.4"
      }

      item2 = %{
        category: :pizza,
        description: "Pizza de frango com calabreza",
        quantity: 1,
        unit_price: "42.2"
      }

      {:ok, cpf: cpf, item1: item1, item2: item2}
    end

    test "when all param is valid, saves the order", %{cpf: cpf, item1: item1, item2: item2} do
      params = %{cpf: cpf, items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end
  end
end
