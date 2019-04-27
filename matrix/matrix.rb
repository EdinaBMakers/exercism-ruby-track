class Matrix
  def initialize(matrix_str)
    @matrix = matrix_str\
      .split(/\n/)\
      .map{|row_str| row_str.scan(/\b\d+\b/)\
      .map{|num_str| num_str.to_i}}
  end
  
  def rows()
    @matrix
  end
  
  def columns()
    rows.transpose
  end
  
end
