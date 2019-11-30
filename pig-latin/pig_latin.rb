class PigLatin
  def self.translate(phrase)
    return phrase.split(" ").map {|word| translate_word(word)}.join(" ")
  end

  def self.translate_word(word)
    return word[1] + word[0] + "ay" if word.length == 2 && word[1] == "y"
    
    if (/^[^aeiou]+y/.match(word))
      index_of_y = word.index("y")

      return word[index_of_y..-1] + word[0, index_of_y] + "ay"
    end

    return word[3..-1] + word[0, 3] + "ay" if /^[^aeiou]{1}(qu)|(thr)|(sch)/.match(word)
    return word[2..-1] + word[0, 2] + "ay" if /^(ch|qu|th)/.match(word)
    return word + "ay" if /^[aeiou]|(yt)|(xr)/.match(word)
    return word[1..-1] + word[0] + "ay" if /^[^aeiou]/.match(word)
  end
end