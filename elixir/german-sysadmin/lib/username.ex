defmodule Username do
  def sanitize(username) do
    Enum.reduce(username, '', fn c, acc ->
      acc ++ case c do
        ?_ -> '_'
        ?ä -> 'ae'
        ?ö -> 'oe'
        ?ü -> 'ue'
        ?ß -> 'ss'
        c when c in ?a ..?z -> [c]
        _ -> ''
      end
    end)
  end
end
