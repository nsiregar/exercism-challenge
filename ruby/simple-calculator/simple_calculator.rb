# frozen_string_literal: true

class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError if first_operand.instance_of?(String) || second_operand.instance_of?(String)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include? operation

    begin
      "#{first_operand} #{operation} #{second_operand} = #{first_operand.send(operation, second_operand)}"
    rescue ZeroDivisionError => e
      'Division by zero is not allowed.'
    end
  end

  class UnsupportedOperation < StandardError
  end
end
