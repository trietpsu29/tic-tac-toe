class GameBoard
  attr_reader :board

  def initialize
    @board = default_board
  end

  def default_board
    (1..9).map { |n| [n, n] }.to_h
  end

  def draw(symbol, pos)
    @board[pos] = symbol
  end

  def display
    puts "\n"
    puts " #{@board[1]} | #{@board[2]} | #{@board[3]} "
    puts '---+---+---'
    puts " #{@board[4]} | #{@board[5]} | #{@board[6]} "
    puts '---+---+---'
    puts " #{@board[7]} | #{@board[8]} | #{@board[9]} "
    puts "\n"
  end

  def clear
    @board = default_board
  end
end
