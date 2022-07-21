class Triangle
  # write code here
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle
    if self.side1 == self.side2 && self.side2 == self.side3 && self.side1 == self.side3
      return :equilateral
    elsif self.side1 == self.side2 || self.side2 == self.side3 || self.side1 == self.side3
      return :isosceles
    else
      self.side1 != self.side2 && self.side2 != self.side3 && self.side1 != self.side3
      return :scalene
      # elsif self.side1 == 0 || self.side2 == 0 || self.side3 == 0
      #   raise TriangleError
      #  puts error.message
    end
  end

  def validate_triangle
    unless triangle_inequality && validate_greater_than_0
      raise TriangleError
    end
  end

  def validate_greater_than_0
    @side1 > 0 && @side2 > 0 && @side3 > 0
  end

  def triangle_inequality
    @side1 + @side2 > @side3 && @side1 + @side3 > @side2 && @side2 + @side3 > @side1
  end

  class TriangleError < StandardError
    # triangle error code
    # def message
    #   "error"
    # end
  end
end
