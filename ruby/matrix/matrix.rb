# frozen_string_literal: true

class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_string)
    @rows = matrix_string.each_line.map { |line| line.split.map(&:to_i) }
    @columns = rows.transpose
  end
end
