require 'space'
require 'board'
require 'player'
require 'game'
require 'rspec'

describe Space do
  describe '#initialize' do
    it 'initializes a new instance of Space' do
      test_space = Space.new(0, 0)
      test_space.should be_an_instance_of Space
    end
  end

  describe '#mark_by' do
    it 'lets a player mark a space' do
      test_space = Space.new(1,2)
      test_player = Player.new('X')
      test_space.mark_by(test_player)
      test_space.marked_by.should eq test_player
    end
  end

end

describe Board do
  describe '#initialize' do
    it 'initializes a new instance of Board' do
      test_board = Board.new
      test_board.should be_an_instance_of Board
    end

    it 'creates 9 instances of Space' do
      test_board = Board.new
      test_board.spaces.count.should eq 9
    end

    it 'has each Space hold the proper coordintates' do
      test_board = Board.new
      test_board.spaces[8].x_coordinate.should eq 2
      test_board.spaces[8].y_coordinate.should eq 2
    end
  end

  describe '#row' do
    it 'returns an array of Spaces corresponding to the certain row' do
      test_board = Board.new
      test_board.row(0).count.should eq 3
    end
  end

  describe '#column' do
    it 'returns an array of Spaces corresponding to the certain column' do
      test_board = Board.new
      test_board.column(0).count.should eq 3
    end
  end

  describe '#check_win' do
    it 'returns false if a player does not have 3 in a row' do
      test_board = Board.new
      test_player = Player.new('X')
      test_board.check_win(test_player).should eq false
    end

    it 'returns true if a player has three in a row' do
      test_board = Board.new
      test_player = Player.new('X')
      test_board.spaces[0].mark_by(test_player)
      test_board.spaces[4].mark_by(test_player)
      test_board.spaces[8].mark_by(test_player)
      test_board.check_win(test_player).should eq true
    end
  end
end

describe Player do
  describe '#initialize' do
    it 'should initialize an instance of Player' do
      test_player = Player.new('X')
      test_player.should be_an_instance_of Player
    end

    it 'initializes player with a value' do
      test_player = Player.new('X')
      test_player.value.should eq 'X'
    end
  end
end

describe Game do
  describe '#initialize' do
    it 'initializes an instance of Game' do
      test_game = Game.new
      test_game.should be_an_instance_of Game
    end

    it 'should create a board' do
      test_game = Game.new
      test_game.board.should be_an_instance_of Board
    end

    it 'creates two players with the values of X and O' do
      test_game = Game.new
      test_game.player_one.value.should eq 'X'
      test_game.player_two.value.should eq 'O'
    end
  end
end




