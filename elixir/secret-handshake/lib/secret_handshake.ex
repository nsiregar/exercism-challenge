defmodule SecretHandshake do
  import Bitwise

  @handshake_codes %{
    0b00001 => "wink",
    0b00010 => "double blink",
    0b00100 => "close your eyes",
    0b01000 => "jump"
  }

  @reverse_code 0b10000

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    list =
      @handshake_codes
      |> Enum.reduce([], fn ({bit, value}, acc) ->
        if (code &&& bit) == bit, do: acc ++ [value], else: acc
      end)

    case code &&& @reverse_code do
      0b10000 -> Enum.reverse(list)
      _ -> list
    end
  end
end
