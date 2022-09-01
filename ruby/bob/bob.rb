# frozen_string_literal: true

class Bob
  def self.hey(remark)
    new(remark).hey
  end

  def initialize(remark)
    @remark = remark.to_s.strip
  end

  def hey
    return 'Fine. Be that way!' if @remark.empty?
    return 'Calm down, I know what I\'m doing!' if yelling? && question?
    return 'Sure.' if question?
    return 'Whoa, chill out!' if yelling?

    'Whatever.'
  end

  private

  def question?
    @remark[-1] == '?'
  end

  def yelling?
    !@remark.match(/[[:alpha:]]+/).nil? && @remark == @remark.upcase
  end
end
