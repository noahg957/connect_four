require 'pry'
require 'pp'
require 'colorize'
class Board
  def initialize
    create_board()
    @end = false
    @filled = []
    @guess_again = false
  end
  attr_reader :board, :end, :guess_again
  def create_board
    @board = [['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                      ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                      ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                      ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                      ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                      ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_']]
  end
  def display_board
    array_of_strings = []
    @board.each do |row|
      if row[0] != ""
        row.unshift("")
      end
      if row[row.length-1] != ""
        row.push("")
      end 
      array_of_strings.push(row.join(" | "))
    end
    array_of_strings.push("   1   2   3   4   5   6   7")
    puts array_of_strings
  end
  def drop_token(column,token)
    row = 5
    while @filled.include?([row, column])
      row -= 1
    end
    if row >= 0
      @board[row][column] = "#{token}"
      @filled.push([row,column])
      @guess_again = false
      @board
    else
      puts "sorry, full column"
      @guess_again = true
    end
  end
  def check_horizontal(token)
    @board.reverse_each do |row|
      i=0
      while i < row.length - 3
        if row[i] == token && row[i + 1] == token && row[i + 2] == token && row[i + 3] == token
          @end = true 
          break
        else
          i += 1
        end
      end
      if @end == true
        break
      end
    end
    @end
  end
  def check_vertical(token)
    c = 0
    while c < @board[0].length
      i = 0
      r = 0
      while i < @board.length - 3
        if @board[r][c] == token && @board[r + 1][c] == token && @board[r + 2][c] == token && @board[r + 3][c] == token
          @end = true
          break
        else
          i += 1
          r += 1
        end
      end
      if @end == true
        break
      end
      c += 1
    end
    @end
  end
  def check_diagonal_down(token)
    #diagonal down right
    c = 0
    while c < @board[0].length
      i = 0
      r = 0
      while i < @board.length - 3
        if @board[r][c] == token && @board[r + 1][c + 1] == token && @board[r + 2][c + 2] == token && @board[r + 3][c + 3] == token
          @end = true
          break
        else
          i += 1
          r += 1
        end
      end
      if @end == true
        break
      end
      c += 1
    end
    @end
  end
  def check_diagonal_up(token)
    #diagonal up right
    c = 0
    while c < @board[0].length
      i = 0
      r = 5
      while r > 2
        if @board[r][c] == token && @board[r - 1][c + 1] == token && @board[r - 2][c + 2] == token && @board[r - 3][c + 3] == token
          @end = true
          break
        else
          i += 1
          r -= 1
        end
      end
      c += 1
    end
    @end
  end
  def check_board(token)
    check_horizontal(token)
    check_vertical(token)
    check_diagonal_down(token)
    check_diagonal_up(token)
    @end
  end
end
