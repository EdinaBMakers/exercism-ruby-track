class TwelveDays
  
  DAYS_AND_PRESENTS = {
    "first" => "a Partridge in a Pear Tree",
    "second" => "two Turtle Doves",
    "third" => "three French Hens",
    "fourth" => "four Calling Birds",
    "fifth" => "five Gold Rings",
    "sixth" => "six Geese-a-Laying",
    "seventh" => "seven Swans-a-Swimming",
    "eighth" => "eight Maids-a-Milking",
    "ninth" => "nine Ladies Dancing",
    "tenth" => "ten Lords-a-Leaping",
    "eleventh" => "eleven Pipers Piping",
    "twelfth" => "twelve Drummers Drumming"
  }
  
  DAYS = DAYS_AND_PRESENTS.keys
  PRESENTS = DAYS_AND_PRESENTS.values
  
  def self.song
    TwelveDays.new.song
  end
  
  def song   
    (1..12).map{|day| verse(day)}.join.chop
  end
  
  private
  
  def verse(day)
    presents_arr = presents(day)
    "On the #{day_str(day)} day of Christmas my true love gave to me: #{presents_str(presents_arr)}.\n\n"
  end 
  
  def day_str(day)
    DAYS[day - 1]
  end
  
  def presents(day)
    PRESENTS.slice(0..day-1).reverse
  end
  
  def presents_str(presents)
    presents_list = presents[-1]
    
    if presents.size > 1
      presents_list = "#{presents.slice(0..-2).join(", ")}, and #{presents_list}"
    end
    
    presents_list
  end
  
end  