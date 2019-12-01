class Cipher
  def initialize(key=generate_random_key)
    raise ArgumentError if !/\A[a-z]+\z/.match(key)
    @key = key
  end

  def key
    @key
  end

  def encode(plaintext)
    key[0, plaintext.length].chars.each_with_index.map do |char, index|
      shifted_alphabet_position = (plaintext[index].ord - 97 + char.ord - 97) % 26
      (97 + shifted_alphabet_position).chr
    end.join()
  end

  def decode(encoded_text)
    key[0, encoded_text.length].chars.each_with_index.map do |char, index|\
      encoded_alphabet_position = encoded_text[index].ord - 97
      key_alphabet_position = char.ord - 97

      encoded_alphabet_position += 26 if key_alphabet_position > encoded_alphabet_position

      (encoded_alphabet_position - key_alphabet_position + 97).chr
    end.join()
  end

  private

  def generate_random_key
    range = [*'a'..'z']
    
    (0...100).map{ range.sample }.join
  end
end