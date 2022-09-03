# frozen_string_literal: true

class ListOps
  def self.arrays(array)
    new(array).count
  end

  def self.reverser(array)
    new(array).reverse
  end

  def self.concatter(array1, array2)
    new(array1).concat(array2)
  end

  def self.mapper(array, &block)
    new(array).map(&block)
  end

  def self.filterer(array, &block)
    new(array).filter(&block)
  end

  def self.sum_reducer(array)
    new(array).sum_reduce
  end

  def self.factorial_reducer(array)
    new(array).factorial_reduce
  end

  def initialize(array)
    @array = array
  end

  def count
    idx = 0
    loop do
      item = @array.fetch(idx, EmptyObject.new)
      break idx if item.is_a? EmptyObject

      idx += 1
    end
  end

  def reverse
    idx = 0
    reversed = []
    loop do
      item = @array.fetch(idx, EmptyObject.new)
      break reversed if item.is_a? EmptyObject

      reversed.unshift(item)
      idx += 1
    end
  end

  def concat(new_array)
    idx = 0
    loop do
      item = new_array.fetch(idx, EmptyObject.new)
      break @array if item.is_a? EmptyObject

      @array << item
      idx += 1
    end
  end

  def map(&block)
    return @array unless block_given?

    idx = 0
    mapped = []
    loop do
      item = @array.fetch(idx, EmptyObject.new)
      break mapped if item.is_a? EmptyObject

      mapped << block.call(item)
      idx += 1
    end
  end

  def filter(&block)
    return @array unless block_given?

    idx = 0
    filtered = []
    loop do
      item = @array.fetch(idx, EmptyObject.new)
      break filtered if item.is_a? EmptyObject

      filtered << item if block.call(item)
      idx += 1
    end
  end

  def sum_reduce
    initial_value = 0
    idx = 0
    loop do
      item = @array.fetch(idx, EmptyObject.new)
      break initial_value if item.is_a? EmptyObject

      initial_value += item
      idx += 1
    end
  end

  def factorial_reduce
    initial_value = 1
    idx = 0
    loop do
      item = @array.fetch(idx, EmptyObject.new)
      break initial_value if item.is_a? EmptyObject

      initial_value *= item
      idx += 1
    end
  end

  class EmptyObject; end
end
