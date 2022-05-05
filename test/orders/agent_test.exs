defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Order
  import Exlivery.Factory

  describe "save/1" do
    test "save the order" do
      order = build(:order)

      OrderAgent.start_link(%{})

      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})
      :ok
    end

    test "When the order is found, return the order" do
      order = build(:order)
      {:ok, uuid} =  OrderAgent.save(order)

      response = OrderAgent.get(uuid)

      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "When the order is not found, return a error message" do

      response = OrderAgent.get("190384720")

      expected_response = {:error, "Order not found"}

      assert response == expected_response
    end
  end
end
