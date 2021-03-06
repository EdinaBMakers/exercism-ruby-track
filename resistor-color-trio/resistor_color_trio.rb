class ResistorColorTrio
  COLORS = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white']

  def initialize(colors)
    @colors = colors
  end

  def label
    raise ArgumentError if @colors.any? { |color| !COLORS.include?(color) }

    return "Resistor value: #{resistor_value_with_unit}"
  end

  private

  def resistor_value_with_unit
    first_color = @colors[0]
    second_color = @colors[1]
    third_color = @colors[2]

    resistor_value = (10 * color_value(first_color) + color_value(second_color)) * 10 ** color_value(third_color)
    
    return resistor_value / 1000 > 1 ? "#{resistor_value / 1000} kiloohms" : "#{resistor_value} ohms"
  end

  def color_value(color)
    return COLORS.index(color)
  end
end