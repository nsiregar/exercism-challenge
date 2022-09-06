defmodule ResistorColorTrio do
  @color_map %{
    :black => 0,
    :brown => 1,
    :red => 2,
    :orange => 3,
    :yellow => 4,
    :green => 5,
    :blue => 6,
    :violet => 7,
    :grey => 8,
    :white => 9
  }

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms}
  def label(colors) do
    [color1, color2, color3 | _] = colors
    ((@color_map[color1] * 10 + @color_map[color2]) * :math.pow(10, @color_map[color3]))
    |> trunc()
    |> format()
  end

  defp format(r) when r >= 1000, do: {div(r, 1000), :kiloohms}
  defp format(r), do: {r, :ohms}
end
