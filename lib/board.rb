require 'pry'
class Board
  def create_board
    @display_board = [['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                      ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                      ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                      ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                      ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                      ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                      ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_']]
  end
  def display_board
    array_of_strings = []
    @display_board.each do |row|
      row.unshift("")
      row.push("") 
      array_of_strings.push(row.join(" | "))
    end
    array_of_strings.push("   1   2   3   4   5   6   7")
    puts array_of_strings
  end
end