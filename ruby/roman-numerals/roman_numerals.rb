# frozen_string_literal: true

module RomanNumerals
  ROMAN_PAIRS = {
    1000 => 'M',
    900 => 'CM',
    500 => 'D',
    400 => 'CD',
    100 => 'C',
    90 => 'XC',
    50 => 'L',
    40 => 'XL',
    10 => 'X',
    9 => 'IX',
    5 => 'V',
    4 => 'IV',
    1 => 'I'
  }.freeze

  def to_roman
    number = self
    ROMAN_PAIRS.map do |digit, numeral|
      quantity = number / digit
      number -= digit * quantity
      numeral * quantity
    end.join
  end
end

class Integer
  include RomanNumerals
end
