# frozen_string_literal: true

class TwoBucket
  attr_reader :moves

  def initialize(size_one, size_two, goal, start)
    @buckets = [
      Bucket.new('one', size_one),
      Bucket.new('two', size_two)
    ]
    @buckets.reverse! if start != 'one'
    @goal = goal
    @moves = 0
    calculate_moves
  end

  def goal_bucket
    @goal_bucket ||= @buckets.select { |bucket| bucket.amount == @goal }.first.name
  end

  def other_bucket
    @other_bucket ||= @buckets.reject { |bucket| bucket.amount == @goal }.first.amount
  end

  private

  def calculate_moves
    return if @buckets.any? { |bucket| bucket.amount == @goal }

    @moves += 1
    if @buckets.first.empty?
      @buckets.first.fill
    elsif @buckets.last.size == @goal
      @buckets.last.fill
    elsif @buckets.last.remaining_capacity.nonzero?
      @buckets.first.pour(@buckets.last)
    else
      @buckets.last.empty
    end
    calculate_moves
  end
end

class Bucket
  attr_accessor :amount
  attr_reader :name, :size

  def initialize(name, size)
    @name = name
    @size = size
    @amount = 0
  end

  def remaining_capacity
    @size - @amount
  end

  def fill
    @amount = size
  end

  def empty
    @amount = 0
  end

  def empty?
    @amount.zero?
  end

  def pour(other)
    amount_to_pour = [@amount, other.remaining_capacity].min
    @amount -= amount_to_pour
    other.amount += amount_to_pour
  end
end
