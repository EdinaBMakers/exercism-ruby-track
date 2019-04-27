class Series
  def initialize(str)
    @str = str
  end
  
  def slices(n)  
    raise ArgumentError.new if n > @str.length
    
    (0..(@str.length - n)).map do |start_index|
      @str.slice(start_index,n)
    end
  end
end
