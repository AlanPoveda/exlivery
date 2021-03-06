defmodule Exlivery.Users.Agent do
  alias Exlivery.Users.User

  use Agent

  def start_link(_initial_state) do
        Agent.start_link(fn -> %{} end, name: __MODULE__)

  end

  def save(%User{} = user), do: Agent.update(__MODULE__, &update_state(&1, user))

  def get(cpf), do: Agent.get(__MODULE__, &get_user(&1, cpf))

  defp update_state(state, %User{cpf: cpf} = user), do: Map.put(state, cpf, user)

  defp get_user(state, cpf) do
          state
          |> Map.get(cpf)
          |> handle_get()
  end

  defp handle_get(nil), do: {:error, "User not found"}
  defp handle_get(user), do: {:ok, user}

end
