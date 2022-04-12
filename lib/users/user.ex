defmodule Exlivery.Users.User do
  @keys [:name, :email, :cpf, :age]
  @enforce_keys @keys
  defstruct @keys

  #Normalmente num struct tem uma função de build, para não ter que digitar toda vez, pedaço por pedaço
  def build(name, email, cpf, age) when age >= 18 do
    {:ok, %__MODULE__{
      name: name,
      email: email,
      cpf: cpf,
      age: age
    }}
  end

  def build(_name, _email, _cpf, _age), do: {:error, "Invalid parameters"}

end
