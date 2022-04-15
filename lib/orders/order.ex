defmodule Exlivery.Orders.Order do
  alias Exlivery.Orders.Item
  alias Exlivery.Users.User

  @keys [:user_cpf, :delivery_adress, :item, :total_price]
  @enforce_keys @keys

  defstruct @keys

  # Aqui foi feito um patter de uma string para ela sempre receber um item.
  def build(%User{cpf: cpf, address: address}, [%Item{} | _items] = items) do
    {:ok,
     %__MODULE__{
       user_cpf: cpf,
       delivery_adress: address,
       item: items,
       total_price: calculate_total_price(items)
     }}
  end

  def build(_user, _item), do: {:error, "Invalid inputs"}

  defp calculate_total_price(items) do
    Enum.reduce(items, Decimal.new("0.00"), &sum_prices(&1,&2))
  end

  #Aqui esta somando, pegando já o valor do preço e a quantidade
  #Ele também usa o modulo Decimal para fazer as operações.
  defp sum_prices(%Item{unit_price: price, quantity: quantity }, acc) do
    price
    |> Decimal.mult(quantity)
    |> Decimal.add(acc)

  end
end
