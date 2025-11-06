require_relative 'game_board'

class Player
  attr_accessor :symbol, :score

  def initialize(symbol, score)
    @symbol = symbol
    @score = score
  end

  def draw(board, pos)
    board.draw(@symbol, pos)
  end
end
