# frozen_string_literal: true

class Change
  def self.generate(coins, amount)
    new(coins, amount).generate
  end

  def initialize(coins, amount)
    @coins = coins
    @amount = amount
  end

  def generate
    validate
    change_options = @coins.each_with_index.map do |_coin, idx|
      coin_set = @coins.reverse[idx..-1]
      generate_combination_by_set(coin_set)
    end.compact.min_by(&:count)

    change_options = generate_combination_by_loop if change_options.nil?

    raise ImpossibleCombinationError if change_options.nil?

    change_options
  end

  private

  def validate
    raise NegativeTargetError if @amount.negative?
    raise ImpossibleCombinationError if @coins.min > @amount && @amount != 0
  end

  def generate_combination_by_set(coin_set)
    change_combination = []
    total = @amount
    coin_set.each do |coin|
      until coin > total
        total -= coin
        change_combination.unshift(coin)
      end
    end
    change_combination if total.zero?
  end

  def generate_combination_by_loop
    change_combination = []
    total = @amount
    @coins.each_with_index do |coin, index|
      until @coins[index + 1..-1].any? { (total % _1).zero? } || total <= 0
        total -= coin
        change_combination.push(coin)
      end
    end
    change_combination if total.zero?
  end

  class ImpossibleCombinationError < StandardError; end

  class NegativeTargetError < StandardError; end
end
