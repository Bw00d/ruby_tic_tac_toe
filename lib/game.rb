class Game
  attr_reader :player_one, :player_two, :whos_turn, :board

  def initialize
    @player_one = Player.new('X')
    @player_two = Player.new('O')
    @whos_turn = @player_one
    @board = Board.new
  end

  def start_game
    self.take_turn
  end

  def take_turn
    if @board.full?
      puts "Draw!"
    else
      puts "Player #{@whos_turn.value}, enter your coordinates:"
      print "> "
      input = gets.chomp
      coordinates = input.split(', ')
      space = @board.row(coordinates[1].to_i)[coordinates[0].to_i]
      unless space.marked_by.nil?
        @board.print_board
        puts "Space is already marked, try again."
        take_turn
      end
      space.mark_by(@whos_turn)
      @board.print_board
      unless @board.check_win(@whos_turn)
        self.toggle_turn
        self.take_turn
      else
        puts "Player #{@whos_turn.value} wins!"
      end
    end
  end

  def toggle_turn
    if @whos_turn == @player_one
      @whos_turn = @player_two
    elsif @whos_turn == @player_two
      @whos_turn = @player_one
    else
      puts 'Error!'
    end
  end

end
