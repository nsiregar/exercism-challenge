defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    inventory
    |> Enum.sort_by(& &1.price, :asc)
  end

  def with_missing_price(inventory) do
    inventory
    |> Enum.filter(&(&1.price == nil))
  end

  def update_names(inventory, old_word, new_word) do
    inventory
    |> Enum.map(&update_name(&1, old_word, new_word))
  end

  defp update_name(item, old, new) do
    %{item | name: String.replace(item.name, old, new)}
  end

  def increase_quantity(item, count) do
    %{
      :name => item.name,
      :price => item.price,
      :quantity_by_size => Enum.into(item.quantity_by_size, %{}, fn {k, v} -> {k, v + count} end)
    }
  end

  def total_quantity(item) do
    item.quantity_by_size
    |> Enum.reduce(0, fn {_, v}, acc -> acc + v end)
  end
end
