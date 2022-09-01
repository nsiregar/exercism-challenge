# frozen_string_literal: true

class Phrase
  TOKENISE_PATTERN = /[a-zA-Z0-9\-']+/.freeze
  NON_WORD_SUFFIX_PATTERN = /^'|\s|('s)$|'$/i.freeze

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.scan(TOKENISE_PATTERN)
                   .map(&:downcase)
                   .map { |word| word.gsub(NON_WORD_SUFFIX_PATTERN, '') }
    words.each_with_object(Hash.new(0)) { |e, total| total[e] += 1 }
  end
end
