# frozen_string_literal: true

class FlattenArray
  def self.flatten(array)
    array.each_with_object([]) do |element, result|
      if element.is_a?(Array)
        result.concat(flatten(element))
      else
        result << element unless element.nil?
      end
    end
  end
end
