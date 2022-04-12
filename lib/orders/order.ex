defmodule Exlivery.Orders.Order do
  @keys [:user_cpf, :delivery_adress, :item, :total_price ]
  @enforce_keys @keys

  defstruct @keys


  def build(user_cpf, delivery_adress, item, total_price) do
    {:ok, %__MODULE__{
      user_cpf: user_cpf,
      delivery_adress: delivery_adress,
      item: item,
      total_price: total_price
    }}
  end

  def build(_user_cpf, _delivery_adress, _item, _total_price), do: {:error, "Invalid inputs"}

end
