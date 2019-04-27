module Luhn
  def self.valid?(num_str)
    return false unless /^[\d\s]{2,}$/.match(num_str.strip)
    luhn(num_str) % 10 == 0
  end

  def self.luhn(num_str)
    num_str.scan(/\d/).reverse.map(&:to_i).each_with_index.map do |digit, index|
      if index.odd?
        doubled = digit * 2
        doubled > 9 ? doubled - 9 : doubled
      else
        digit
      end
    end.sum
  end
end
