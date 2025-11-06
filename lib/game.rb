require_relative 'game_board'
require_relative 'player'

class Game
  def initialize
    @board = GameBoard.new
    @player1 = Player.new('X', 0)
    @player2 = Player.new('O', 0)
  end

  def play
    puts 'New game starts:'
    @board.display
    loop do
      puts "#{@player1.symbol}'s turn. Choose a position:"
      pos = gets.chomp
      @player1.draw(@board, pos.to_i)
      @board.display
      if check
        @board.clear
        next
      end
      puts "#{@player2.symbol}'s turn. Choose a position:"
      pos = gets.chomp
      @player2.draw(@board, pos.to_i)
      @board.display
      @board.clear if check
    end
  end

  def check
    curr = @board.board
    lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

    lines.each do |a, b, c|
      next unless curr[a] == curr[b] && curr[b] == curr[c]

      winner = curr[a]
      puts "#{winner} wins the game!"
      puts 'New game starts:'
      return true
    end

    if curr.values.all? { |v| v.is_a?(String) }
      puts "It's a draw!"
      puts 'New game starts:'
      return true
    end

    false
  end
end
