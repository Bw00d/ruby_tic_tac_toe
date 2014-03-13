class Board
  attr_reader :spaces

  def initialize
    @spaces = []
    (0..2).each do |y|
      (0..2).each do |x|
        @spaces << Space.new(x, y)
      end
    end
  end

  def row(number)
    selected_row = []
    @spaces.each do |space|
      if space.y_coordinate == number
        selected_row << space
      end
    end
    selected_row
  end

  def column(number)
    selected_column = []
    @spaces.each do |space|
      if space.x_coordinate == number
        selected_column << space
      end
    end
    selected_column
  end

  def diagonal_one
    [@spaces[0], @spaces[4], @spaces[8]]
  end

  def diagonal_two
    [@spaces[2], @spaces[4], @spaces[6]]
  end

  def check_win(player)
    (0..2).each do |i|
      if self.win_checker(self.row(i), player)
        return true
      end
    end

    (0..2).each do |i|
      if self.win_checker(self.column(i), player)
        return true
      end
    end

    if self.win_checker(self.diagonal_one, player)
      true
    elsif self.win_checker(self.diagonal_two, player)
      true
    else
      false
    end
  end

  def win_checker(lane, player)
    count = 0
    lane.each do |space|
      if space.marked_by == player then count += 1 end
    end
    if count == 3
      true
    else
      false
    end
  end

=begin
  def print_board
    row(0).each do |space|
      if space.marked_by == nil
        print '$ '
      elsif space.marked_by == 'X'
        print 'X '
      else
        print 'O '
      end
    end
    puts
    row(1).each do |space|
      if space.marked_by == nil
        print '$ '
      elsif space.marked_by == 'X'
        print 'X '
      else
        print 'O '
      end
    end
    puts
    row(2).each do |space|
      if space.marked_by == nil
        print '$ '
      elsif space.marked_by.value == 'X'
        print 'X '
      elsif space.marked_by.value == 'O'
        print 'O '
      else
        print '?'
      end
    end
  end
=end

  def print_board
    (0..2).each do |i|
      self.row(i).each do |space|
        marked = space.marked_by
        if marked.nil?
          print '#'
        elsif marked.value == 'X'
          print 'X'
        elsif marked.value == 'O'
          print 'O'
        else
          print '?'
        end
      end
      puts
    end
  end

end
