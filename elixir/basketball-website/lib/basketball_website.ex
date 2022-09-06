defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    String.split(path, ".")
    |> Enum.reduce(data, fn s,d -> d[s] end )
  end

  def get_in_path(data, path) do
    data
    |> Kernel.get_in(String.split(path, "."))
  end
end
