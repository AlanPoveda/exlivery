defmodule Exlivery.Orders.OrderTest do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "When all param is valid, return an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Hambuer de quarteirao",
          category: :hamburger,
          unit_price: Decimal.new("28.9")
        )
      ]

      response = Order.build(user, items)

      expected_response = {:ok, build(:order)}

      assert response == expected_response
    end

    test "Whn there is not items, return an error" do
      user = build(:user)

      items = []

      response = Order.build(user, items)

      expected_response = {:error, "Invalid inputs"}

      assert response == expected_response

    end
  end
end
