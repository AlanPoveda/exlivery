defmodule Exlivery.Users.User do
  @keys [:address, :name, :email, :cpf, :age]
  @enforce_keys @keys
  defstruct @keys

  #Normalmente num struct tem uma função de build, para não ter que digitar toda vez, pedaço por pedaço
  def build(name, email, cpf, age, address) when age >= 18 and is_bitstring(cpf) do
    {:ok,
      %__MODULE__{
      name: name,
      email: email,
      cpf: cpf,
      age: age,
      address: address,
    }}
  end

  def build(_address, _name, _email, _cpf, _age), do: {:error, "Invalid parameters"}

end
