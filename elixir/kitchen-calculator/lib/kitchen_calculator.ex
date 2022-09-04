defmodule KitchenCalculator do
  @volume_ratios %{
    milliliter: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15
  }

  def get_volume(volume_pair) do
    volume_pair
    |> elem(1)
  end

  def to_milliliter(volume_pair) do
    {:milliliter, volume_pair
                  |> get_volume
                  |> Kernel.*(@volume_ratios[volume_pair |> elem(0) ])
    }
  end

  def from_milliliter(volume_pair, unit) do
    {unit, volume_pair
           |> get_volume
           |> Kernel./(@volume_ratios[unit])
    }
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter
    |> from_milliliter(unit)
  end
end
