# frozen_string_literal: true

class Brackets
  OPEN_PARENTHESIS_CHAR = %w|[ { (|.freeze
  CLOSE_PARENTHESIS_CHAR = %w|] } )|.freeze
  PARENTHESIS_PAIR = {
    ']' => '[',
    '}' => '{',
    ')' => '('
  }.freeze

  def self.paired?(input_string)
    new(input_string).paired?
  end

  def initialize(input_string)
    @input_string = input_string
    @stack = []
  end

  def paired?
    pattern = Regexp.union(OPEN_PARENTHESIS_CHAR + CLOSE_PARENTHESIS_CHAR)
    @input_string.scan(pattern).each do |char|
      if OPEN_PARENTHESIS_CHAR.include? char
        @stack.push(char)
      elsif CLOSE_PARENTHESIS_CHAR.include? char
        return false unless @stack.pop == PARENTHESIS_PAIR[char]
      end
    end

    @stack.empty?
  end
end
