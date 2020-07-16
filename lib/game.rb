require_relative "board"
require_relative "player"

class Game
  def initialize
    @board = Board.new
    @result = "in progress"
    @winner = nil
  end
  def get_players
    puts "Player 1, what's your name?"
    begin 
      name1 = gets.chomp
    rescue
    end
    puts "Player 2, what's your name?"
    begin
      name2 = gets.chomp
    rescue
    end
    puts "Who wants to go first?"
    begin
      if gets.chomp == name1
        @player_1 = Player.new(name1,1)
        @player_2 = Player.new(name2,2)
      else
        @player_1 = Player.new(name2,1)
        @player_2 = Player.new(name1,2)
      end
    rescue
      @player_1 = Player.new(name1,1)
      @player_2 = Player.new(name2,2)
    end
  end
  attr_reader :board, :player_1, :player_2, :result
  def game_loop
    @board.display_board
    while @board.end == false
      @board.drop_token(@player_1.get_move, @player_1.token)
      unless @board.guess_again == true
        @board.display_board
        @board.check_board(@player_1.token)
      else
        while @board.guess_again == true
          @board.drop_token(@player_1.get_move, @player_1.token)
        end
        @board.display_board
        @board.check_board(@player_1.token)
      end
      unless @board.check_board(@player_1.token) == true
        unless @board.guess_again == true
          @board.drop_token(@player_2.get_move, @player_2.token)
          @board.display_board
          @board.check_board(@player_2.token)
        else
          while @board.guess_again == true
            @board.drop_token(@player_2.get_move, @player_2.token)
          end
          @board.display_board
          @board.check_board(@player_2.token)
        end
      else
        @winner = player_1
      end
    end
    if @winner == nil
      @winner = player_2
    end
    @result = 'end'
    puts "congratulations, #{@winner.name}! You win."
  end
end
new_game = Game.new
new_game.get_players
new_game.game_loop