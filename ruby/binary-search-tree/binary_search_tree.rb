# frozen_string_literal: true

class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(data)
    data > @data ? go_right(data) : go_left(data)
  end

  def go_right(data)
    @right ? @right.insert(data) : @right = Bst.new(data)
  end

  def go_left(data)
    @left ? @left.insert(data) : @left = Bst.new(data)
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    @left&.each(&block)
    block.call(data)
    @right&.each(&block)
  end
end
