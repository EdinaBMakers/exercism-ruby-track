class Raindrops
  @@raindrops_vocab = {3 => "Pling", 5 => "Plang", 7 => "Plong"}
  
  def self.convert(num)
    raindrop_sound = @@raindrops_vocab.map do |factor, sound|
      sound if num % factor == 0
    end.join
    
    raindrop_sound.empty? ? num.to_s : raindrop_sound
  end
  
end