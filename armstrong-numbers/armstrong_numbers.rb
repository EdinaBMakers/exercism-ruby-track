module ArmstrongNumbers
  def self.include?(number)
    digits = number.digits

    return digits.sum {|digit| digit ** digits.length} == number
  end
end