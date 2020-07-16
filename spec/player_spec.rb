require "./lib/player"
require "colorize"
require 'stringio'
describe Player do
  describe "#initialize" do
    it "creates a new object with a name variable" do
      player = Player.new("Jeff",1)
      expect(player.name).to eql("Jeff")
    end
    it "creates a new object with a token variable based on the order" do
      player = Player.new("Jeff",1)
      expect(player.token).to eql("\u24c7".colorize(:red))
    end
  end
  describe "#get_move" do
    player = Player.new("Jeff",1)
    let(:input) { StringIO.new('4') }
    it "prompts the user for a guess" do
      expect { player.get_move }.to output("What column would you like to place your token in, Jeff?\n").to_stdout
    end
    it "takes the guess and sets a variable, guess, equal to the guess" do
        $stdin = input
        player = Player.new("Jeff",1)
        expect(player.get_move).to eql(4)
    end
  end
end