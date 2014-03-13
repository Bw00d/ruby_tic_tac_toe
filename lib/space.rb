class Space
  attr_reader :x_coordinate, :y_coordinate

  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @mark = nil
  end

  def mark_by(player)
    @mark = player
  end

  def marked_by
    @mark
  end
end
