defmodule DNA do
  @code_point_acids %{
    ?\s => 0b0000,
    ?A => 0b0001,
    ?C => 0b0010,
    ?G => 0b0100,
    ?T => 0b1000
  }
  @encoded_acids Map.new(@code_point_acids, fn {key, val} -> {val, key} end)

  def encode_nucleotide(code_point) do
    Map.get(@code_point_acids, code_point)
  end

  def decode_nucleotide(encoded_code) do
    Map.get(@encoded_acids, encoded_code)
  end

  def encode([h]) do
    <<encode_nucleotide(h)::4>>
  end
  def encode([h|t]) do
    <<encode([h])::bitstring, encode(t)::bitstring>>
  end

  def decode(encoded) do
    do_decode(encoded, [])
  end

  defp do_decode(<<>>, acc), do: acc
  defp do_decode(<<value::4, rest::bitstring>>, acc) do
    do_decode(rest, acc++[decode_nucleotide(value)])
  end
end
