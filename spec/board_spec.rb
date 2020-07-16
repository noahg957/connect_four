require "./lib/board"
require "./lib/player"
require 'colorize'
describe Board do
  describe '#create_board' do
    it "sets a variable to equal the display board and returns it" do
      board = Board.new
      expect(board.create_board).to eql([['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                                         ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                                         ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                                         ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                                         ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                                         ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_']])
    end
  end
  describe "#display_board" do
  it "prints the board to console and inserts | in between each element except the last row" do
    board = Board.new
    expect { board.display_board }.to output(
      " | _ | _ | _ | _ | _ | _ | _ | 
 | _ | _ | _ | _ | _ | _ | _ | 
 | _ | _ | _ | _ | _ | _ | _ | 
 | _ | _ | _ | _ | _ | _ | _ | 
 | _ | _ | _ | _ | _ | _ | _ | 
 | _ | _ | _ | _ | _ | _ | _ | 
   1   2   3   4   5   6   7
").to_stdout
    end
  end
  describe '#drop_token' do
    it "places a token in the column selected" do
      board = Board.new
      board.display_board
      expect(board.drop_token(7,"\u24c7")).to eql([['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
                                                   ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
                                                   ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
                                                   ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
                                                   ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
                                                   ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,"\u24c7", '']])
    end
    it "works with stacking" do
      board = Board.new
      board.display_board
      board.drop_token(7,"\u24c7")
      board.display_board
      expect(board.drop_token(7,"\u24c7")).to eq([["", "_", "_", "_", "_", "_", "_", "_", ""],
      ["", "_", "_", "_", "_", "_", "_", "_", ""],
      ["", "_", "_", "_", "_", "_", "_", "_", ""],
      ["", "_", "_", "_", "_", "_", "_", "_", ""],
      ["", "_", "_", "_", "_", "_", "_", "\u24c7", ""],
      ["", "_", "_", "_", "_", "_", "_", "\u24c7", ""]])
    end
    it "works with colors" do
      board = Board.new
      board.display_board
      expect(board.drop_token(4,"\u24c7".colorize(:red))).to eql([['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
      ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
      ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
      ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
      ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
      ['', '_' ,'_' ,'_' ,"\u24c7".colorize(:red) ,'_' ,'_' ,'_', '']])
      board.display_board
    end
    let(:input) { StringIO.new('4') }
    it "works with player class" do
      $stdin = input
      board = Board.new
      player = Player.new("Jeff",2)
      board.display_board
      expect(board.drop_token(player.get_move, player.token)).to eql([['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
      ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
      ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
      ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
      ['', '_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_', ''],
      ['', '_' ,'_' ,'_' ,"\u24b7".colorize(:blue) ,'_' ,'_' ,'_', '']])
    end
  end
    describe "check_board" do
      player = Player.new("Jeff",2)
      op = Player.new("not_jeff",1)
      it "checks a horizontal win" do
        board = Board.new
        board.display_board
        board.drop_token(1,player.token)
        board.display_board
        board.drop_token(2,player.token)
        board.display_board
        board.drop_token(3,player.token)
        board.display_board
        board.drop_token(4,player.token)
        board.display_board
        expect(board.check_horizontal(player.token)).to eql(true)
      end
      it "checks a vertical win" do
        board = Board.new
        board.display_board
        board.drop_token(1,player.token)
        board.display_board
        board.drop_token(1,player.token)
        board.display_board
        board.drop_token(1,player.token)
        board.display_board
        board.drop_token(1,player.token)
        board.display_board
        expect(board.check_vertical(player.token)).to eql(true)
      end
      it "checks a diagonal(down-right) win" do
        board = Board.new
        board.display_board
        board.drop_token(1,player.token)
        board.drop_token(1,player.token)
        board.drop_token(1,player.token)
        board.drop_token(1,op.token)
        board.display_board
        board.drop_token(2,player.token)
        board.drop_token(2,player.token)
        board.drop_token(2,op.token)
        board.display_board
        board.drop_token(3,player.token)
        board.drop_token(3,op.token)
        board.display_board
        board.drop_token(4,op.token)
        board.display_board
        expect(board.check_diagonal_down(op.token)).to eql(true)
    end
    it "checks a diagonal(up-right) win" do
      board = Board.new
      board.display_board
      board.drop_token(4,player.token)
      board.drop_token(4,player.token)
      board.drop_token(4,player.token)
      board.drop_token(4,op.token)
      board.display_board
      board.drop_token(3,player.token)
      board.drop_token(3,player.token)
      board.drop_token(3,op.token)
      board.display_board
      board.drop_token(2,player.token)
      board.drop_token(2,op.token)
      board.display_board
      board.drop_token(1,op.token)
      board.display_board
      expect(board.check_diagonal_up(op.token)).to eql(true)
    end
  end
end