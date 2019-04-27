module Hamming
  
  def self.compute(strand_a, strand_b)
    validateLengths(strand_a, strand_b)
    strand_a.eql?(strand_b) ? 0 : num_of_differences(strand_a.chars, strand_b.chars)
  end
  
  def self.validateLengths(strand_a, strand_b)
    raise ArgumentError.new("Length of sequences are different") if strand_a.length != strand_b.length
  end    
   
 def self.num_of_differences(strand_a_chars, strand_b_chars)
   return 0 if strand_a_chars.length == 0
   
   difference = 0
   strand_a_chars.each_index {|index| difference += 1 if strand_a_chars[index] != strand_b_chars[index]}
   return difference
 end
   
end
