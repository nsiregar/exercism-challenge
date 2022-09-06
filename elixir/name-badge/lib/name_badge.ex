defmodule NameBadge do
  def print(id, name, department) do
    dept = if is_nil(department), do: "OWNER", else: String.upcase(department)
    if is_nil(id) do
      "#{name} - #{dept}"
    else
      "[#{id}] - #{name} - #{dept}"
    end
  end
end
