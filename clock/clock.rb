class Clock
  attr_reader :hours, :minutes
  
  def initialize(hour: 0, minute: 0)
    @minutes = minute % 60
    @hours = (hour + minute / 60) % 24
  end
  
  def to_s
    "#{format('%02d', @hours)}:#{format('%02d', @minutes)}"
  end
  
  def +(other_clock)
    Clock.new(hour: @hours + other_clock.hours, minute: @minutes + other_clock.minutes)
  end
  
  def -(other_clock)
    Clock.new(hour: @hours - other_clock.hours, minute: @minutes - other_clock.minutes)
  end
  
  def ==(other_clock)
    @hours == other_clock.hours && @minutes == other_clock.minutes
  end
  
end