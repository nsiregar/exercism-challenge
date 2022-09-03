# frozen_string_literal: true

class BeerSong
  EMPTY_BOTTLE_VERSE = <<~VERSE
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
  VERSE

  BOTTLE_VERSE = <<~VERSE
    %s of beer on the wall, %s of beer.
    Take %s down and pass it around, %s of beer on the wall.
  VERSE

  def self.recite(from, to)
    new(from, to).recite
  end

  def initialize(from, to)
    @from = from
    @to = to
  end

  def recite
    verses = @from.downto(@from - @to + 1).map do |number|
      next EMPTY_BOTTLE_VERSE if number.zero?

      total_bottles = format_bottles(number)
      taken_bottles = format_taken(number)
      remaining_bottles = format_bottles(number - 1)

      format(BOTTLE_VERSE, total_bottles, total_bottles, taken_bottles, remaining_bottles)
    end
    verses.join("\n")
  end

  def format_bottles(number)
    if number > 1
      "#{number} bottles"
    elsif number == 1
      '1 bottle'
    elsif number.zero?
      'no more bottles'
    end
  end

  def format_taken(number)
    number == 1 ? 'it' : 'one'
  end
end
