defmodule Exlivery.Orders.Agent do
  alias Exlivery.Orders.Item

  use Agent

  def start_link(_initial_state) do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def save(%Order{} = order), do: Agent.update(__MODULE__, &update_state(&1, order))

  def get(cpf), do: Agent.get(__MODULE__, &get_user(&1, cpf))

  defp update_state(state, %Item{cpf: cpf} = item), do: Map.put(state, cpf, user)

  defp get_user(state, cpf) do
    state
    |> Map.get(cpf)
    |> handle_get()
  end

  defp handle_get(nil), do: {:error, "User not found"}
  defp handle_get(user), do: {:ok, user}
end
