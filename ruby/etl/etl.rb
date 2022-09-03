# frozen_string_literal: true

class ETL
  def self.transform(legacy_data)
    new(legacy_data).transform
  end

  def initialize(legacy_data)
    @legacy_data = legacy_data
  end

  def transform
    @legacy_data.each_with_object({}) do |(key, values), new_data|
      values.each { |value| new_data[value.downcase] = key }
    end
  end
end
