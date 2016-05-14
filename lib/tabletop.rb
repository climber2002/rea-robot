# A Tabletop instance is a square tabletop with two dimensions.
# The origin (0,0) can be considered to be the SOUTH WEST most corner.
class Tabletop

  attr_accessor :x_dimension, :y_dimension

  def initialize(x_dimension, y_dimension)
    self.x_dimension = x_dimension
    self.y_dimension = y_dimension  
  end

  # Returns true if the Position(x, y) falls within the bounds of the tabletop
  def falls_within?(x, y)
    x >= 0 && x < x_dimension && y >= 0 && y < y_dimension
  end

  # Returns true if the Position(x, y) falls off the tabletop
  def falls_off?(x, y)
    !falls_within?(x, y)
  end
  
end