# frozen_string_literal: true

class SecretHandshake
  HANDSHAKE_CODES = {
    0b00001 => 'wink',
    0b00010 => 'double blink',
    0b00100 => 'close your eyes',
    0b01000 => 'jump'
  }.freeze

  REVERSE_CODE = 0b10000

  def initialize(number)
    @number = number.to_i
  end

  def commands
    matched_codes = HANDSHAKE_CODES.select do |code, _msg|
      binary_match? code
    end.values

    reverse? ? matched_codes.reverse : matched_codes
  end

  private

  def reverse?
    binary_match? REVERSE_CODE
  end

  def binary_match?(binary_code)
    (@number & binary_code).positive?
  end
end
