class ResistorColorDuo
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def self.value(colors)
    10 * color_value(colors[0]) + color_value(colors[1])
  end

  def self.color_value(color)
    COLORS.index(color)
  end
end