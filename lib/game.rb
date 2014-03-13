class Game
  attr_reader :player_one, :player_two, :board

  def initialize
    @player_one = Player.new('X')
    @player_two = Player.new('O')
    @board = Board.new
  end

end
