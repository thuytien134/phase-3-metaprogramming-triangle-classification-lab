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
    if @side1 == @side2 && @side2 == @side3 && @side1 == @side3
      return :equilateral
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      return :isosceles
    elsif @side1 != @side2 && @side2 != @side3 && @side1 != @side3
      return :scalene
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
  end
end
