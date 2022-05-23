defmodule Exlivery.Orders.Agent do
  alias Exlivery.Orders.Order

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Order{} = order) do
    uuid = UUID.uuid4()
    Agent.update(__MODULE__, &update_state(&1, order, uuid))

    {:ok, uuid}
  end

  def get(uuid), do: Agent.get(__MODULE__, &get_order(&1, uuid))

  def list_all, do: Agent.get(__MODULE__, & &1)

  defp update_state(state, %Order{} = order, uuid), do: Map.put(state, uuid, order)

  defp get_order(state, uuid) do
    state
    |> Map.get(uuid)
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, "Order not found"}
  defp handle_get(order), do: {:ok, order}
end
