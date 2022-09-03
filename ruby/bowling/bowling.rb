# frozen_string_literal: true

class Game
  TOTAL_ROLL_IN_GAME = 10
  FILL_BALL_GAME = 1
  TOTAL_FRAME_IN_GAME = TOTAL_ROLL_IN_GAME + FILL_BALL_GAME

  def initialize
    @current_idx = 0
    @frames = Array.new(TOTAL_FRAME_IN_GAME) { Frame.new }
  end

  def roll(pins)
    raise BowlingError unless tenth_frame.can_continue?
    raise BowlingError if pins.negative?
    raise BowlingError if pins > 10

    @current_idx += 1 if current_frame.next_frame?
    @frames[0..@current_idx].each do |frame|
      frame.add_score pins
    end
  end

  def score
    raise BowlingError if tenth_frame.can_continue?

    @frames.first(TOTAL_ROLL_IN_GAME).sum(&:score)
  end

  private

  def current_frame
    @frames[@current_idx]
  end

  def tenth_frame
    @frames[-2]
  end

  class Frame
    STRIKE_SCORE = 10
    MAX_THROW = 2

    def initialize
      @rolls = []
    end

    def add_score(pins)
      @rolls.push(pins) if can_continue?
      validate
    end

    def can_continue?
      first_throw? || (strike? && can_throw?) || full_throw_scored?
    end

    def next_frame?
      strike? || full_throw?
    end

    def score
      @rolls.sum
    end

    private

    def first_throw?
      @rolls.length < MAX_THROW
    end

    def can_throw?
      @rolls.length <= MAX_THROW
    end

    def full_throw?
      @rolls.length == MAX_THROW
    end

    def strike?
      @rolls.first == STRIKE_SCORE
    end

    def full_throw_scored?
      score == STRIKE_SCORE && can_throw?
    end

    def validate
      raise BowlingError if full_throw? && !strike? && score > STRIKE_SCORE
    end
  end

  class BowlingError < StandardError; end
end
