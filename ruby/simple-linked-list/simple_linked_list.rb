# frozen_string_literal: true

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
    @next = nil
  end
end

class SimpleLinkedList
  def initialize(array = [])
    @root_element = nil
    array.each do |datum|
      element = Element.new(datum)
      push(element)
    end
  end

  def push(element)
    if @root_element.nil?
      @root_element = element
    else
      last_element = last
      last_element.next = element
    end

    self
  end

  def pop
    last_element = last
    return unless last_element

    element = @root_element
    until element.next == last_element
      break if element.next.nil?

      element = element.next
    end
    element.next = nil

    last_element
  end

  def last
    element = @root_element
    return unless element
    return element if element.next.nil?

    until element.next.nil?
      element = element.next
      break element if element.next.nil?
    end
  end

  def to_a
    element = @root_element
    values = []
    return values unless element

    while element
      values.unshift(element.datum)
      break values if element.next.nil?

      element = element.next
    end
  end

  def reverse!
    element = @root_element
    prev_element = nil

    while element
      next_element = element.next
      element.next = prev_element
      prev_element = element
      element = next_element
      @root_element = prev_element
    end

    self
  end
end
