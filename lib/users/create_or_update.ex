defmodule Exlivery.Users.CreateOrUpdate do
  alias Exlivery.Users.User
  alias Exlivery.Users.Agent, as: UserAgent

  def call(%{name: name, email: email, cpf: cpf, age: age, address: address}) do
    name
    |> User.build(email, cpf, age, address)
    |> save_user()

  end

  defp save_user({:ok, %User{} = user}), do: UserAgent.save(user)

  defp save_user({:error, _reason} = error ), do: error

end
