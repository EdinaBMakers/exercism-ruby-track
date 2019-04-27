class Phrase
  def initialize(phrase)
    @phrase = phrase
  end
  
  def word_count
    occurances = Hash.new(0)
    @phrase.downcase.scan(/\b[\w']+\b/).each do |word|
      occurances[word] += 1
    end
    occurances
  end
end