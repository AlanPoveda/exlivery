defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "When all params are valid, returns a item" do
      response = Item.build("Pizza de frango com catupiri", :pizza, "23.3", 1)

      expected_response = {:ok, build(:item)}

      assert response == expected_response

    end

    test "When all params are invalid category, returns a error" do
      response = Item.build("Pizza de frango com catupiri", :error, "23.3", 1)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response

    end

    test "When all params are invalid price, returns a error" do
      response = Item.build("Pizza de frango com catupiri", :pizza, "error", 1)

      expected_response = {:error, "Invalid unit price"}

      assert response == expected_response

   end

   test "When all params are invalid quantity, returns a error" do
    response = Item.build("Pizza de frango com catupiri", :pizza, "23.3", -1)

    expected_response = {:error, "Invalid parameters"}

    assert response == expected_response

   end

  end
end
