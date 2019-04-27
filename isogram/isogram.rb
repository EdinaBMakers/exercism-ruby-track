module Isogram
  def self.isogram?(word)
    letters = word.downcase.delete("^a-z").chars
    letters.uniq.size == letters.size
  end
end
