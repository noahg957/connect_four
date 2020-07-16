require 'require_all'
require_all 'lib'
require "stringio"

describe Game do
  describe "initialize" do
    let(:input) { StringIO.new('Shuki') }
    let(:input2) {StringIO.new('Shmukler')}
    it "creates a board object" do
      $stdin = input
      expect(Game.new.board).to be_a(Board)
    end
  end
  describe "get_players" do
    it "asks users their names and who wants to go first" do
      expect{ Game.new.get_players }.to output("Player 1, what's your name?\n" + "Player 2, what's your name?\n" + "Who wants to go first?\n").to_stdout
    end
    it "creates two player objects" do
      game = Game.new
      game.get_players
      expect(game.player_1).to be_a(Player)
      expect(game.player_2).to be_a(Player)
    end
    it "creates the objects with names and the right order" do
      game = Game.new
      game.stub(:gets).and_return("Jeff\n","Jeremy\n","Jeremy\n")
      game.get_players
      expect(game.player_2.name).to eql("Jeff")
    end
    it "creates the objects with names and the right order" do
      game = Game.new
      game.stub(:gets).and_return("Jeff\n", "Jeremy\n", "Jeremy\n" )
      game.get_players
      expect(game.player_1.name).to eql("Jeremy")
    end
  end
  describe "game_loop" do
    it "continues until a win" do
      game = Game.new
      game.stub(:gets).and_return("Jeff\n","Jeremy\n","Jeremy\n")
      game.get_players
      game.player_1.stub(:gets).and_return("1\n","2\n","3\n","3\n","3\n","3\n")
      game.player_2.stub(:gets).and_return("1\n","2\n","4\n","2\n")
      game.game_loop
      expect(game.result).to eql('end')

      
    end
  end
end