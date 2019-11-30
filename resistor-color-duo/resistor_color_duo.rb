class ResistorColorDuo
  COLORS = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']

  def self.value(colors)
    return 10 * color_value(colors[0]) + color_value(colors[1])
  end

  def self.color_value(color)
    return COLORS.index(color)
  end
end