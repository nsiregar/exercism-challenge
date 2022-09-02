# frozen_string_literal: true

class Grep
  def self.grep(pattern, flags, files)
    new(files).grep(pattern, flags)
  end

  def initialize(files)
    @files = files
  end

  def grep(pattern, flags)
    result = []
    @files.each do |file|
      parser = FileParser.new(file, pattern, flags)
      report = parser.match_list.map do |resp|
        output = [resp.content.strip]
        output.unshift resp.line_number if parser.show_line_number?
        output.unshift resp.filename if @files.count > 1
        output = [resp.filename] if parser.filename_only?

        output.join(':')
      end
      report = report.uniq if parser.filename_only?
      result.concat report
    end

    result.join("\n")
  end
end

class FileParser
  LINE_NUMBER = '-n'
  FILENAME_ONLY = '-l'
  CASE_INSENSITIVE = '-i'
  INVERT_SEARCH = '-v'
  MATCH_LINE = '-x'

  def initialize(file, pattern, flags)
    @file = file
    @pattern = pattern
    @flags = flags.map(&:downcase)
    @result = ParseResult.new
  end

  def match_list
    parse_file
    return @result.excluded if invert_search?

    @result.matched
  end

  def parse_file
    line_number = 0
    IO.foreach(@file) do |line|
      line_number += 1
      parse_resp = ParseResponse.new(filename: @file, line_number: line_number, content: line)
      if match_pattern? line
        @result.matched.push parse_resp
      else
        @result.excluded.push parse_resp
      end
    end
  end

  def show_line_number?
    @flags.include? LINE_NUMBER
  end

  def filename_only?
    @flags.include? FILENAME_ONLY
  end

  private

  def search_pattern
    if case_insensitive?
      @pattern.downcase
    elsif match_line?
      "^#{@pattern}$"
    else
      @pattern
    end
  end

  def match_pattern?(text)
    text = text.downcase if case_insensitive?
    text.match? search_pattern
  end

  def case_insensitive?
    @flags.include? CASE_INSENSITIVE
  end

  def invert_search?
    @flags.include? INVERT_SEARCH
  end

  def match_line?
    @flags.include? MATCH_LINE
  end
end

class ParseResponse
  attr_reader :filename, :line_number, :content

  def initialize(filename:, line_number:, content:)
    @filename = filename
    @line_number = line_number
    @content = content
  end
end

class ParseResult
  attr_reader :matched, :excluded

  def initialize(matched: [], excluded: [])
    @matched = matched
    @excluded = excluded
  end
end
