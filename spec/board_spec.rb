require "./lib/board"
describe Board do
  describe '#create_board' do
    it "sets a variable to equal the display board and returns it" do
      board = Board.new
      expect(board.create_board).to eql([['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
                                         ['_' ,'_' ,'_' ,'_' ,'_' ,'_' ,'_'],
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
    board.create_board
    expect { board.display_board }.to output(
      " | _ | _ | _ | _ | _ | _ | _ | 
 | _ | _ | _ | _ | _ | _ | _ | 
 | _ | _ | _ | _ | _ | _ | _ | 
 | _ | _ | _ | _ | _ | _ | _ | 
 | _ | _ | _ | _ | _ | _ | _ | 
 | _ | _ | _ | _ | _ | _ | _ | 
 | _ | _ | _ | _ | _ | _ | _ | 
   1   2   3   4   5   6   7
").to_stdout
    end
  end
end
