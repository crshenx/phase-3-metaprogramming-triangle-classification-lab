
class Triangle

  attr_reader :side_1, :side_2, :side_3
  
  def initialize side_1, side_2, side_3
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
    @arr = [side_1, side_2, side_3]
  end
  


def kind
  validate_triangle
    if is_equilateral
     :equilateral
   elsif is_isosceles
      :isosceles
    else
      :scalene
    end
 
end

def is_equilateral
  @arr.uniq.length == 1
end

def is_isosceles
  @arr.uniq.length == 2
end

def is_scalene
  @arr.uniq.length == 3
end

def true_triangle?
  #@side_1 - @side_2 < @side_3 &&  @side_1 + @side2 > @side_3 
  @side_1 + @side_2 > @side_3 && @side_1 + @side_3 > @side_2 && @side_2 + @side_3 > @side_1
end


def triangle_positive?
  @arr.all?(&:positive?)
end

def validate_triangle
  raise TriangleError unless triangle_positive? && true_triangle?
end

class TriangleError < StandardError
end

end


