class Player
  def initialize(name,order)
    @possible_columns = [1,2,3,4,5,6,7]
    @name = name
    if order == 1
      @token = "\u24c7".colorize(:red)
    else
      @token = "\u24b7".colorize(:blue)
    end
  end
  attr_reader :token, :name, :guess
  def get_move
    puts "What column would you like to place your token in, #{@name}?"
    begin 
      @guess = gets.chomp.to_i
      if @possible_columns.include?(@guess)
        @guess
      else
        while @possible_columns.include?(@guess) == false
          puts "sorry, not a valid column, put a valid one below"
          @guess = gets.chomp.to_i
        end
      end
    rescue
      "an error occurred"
    end
    @guess
  end
end
