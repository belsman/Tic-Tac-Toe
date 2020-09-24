require './lib/board'

describe Board do
  let(:ttt_board) { Board.new }

  describe '#board' do
    it 'is an array' do
      expect(ttt_board.board).to be_an Array
    end

    it 'has 9 spaces' do
      expect(ttt_board.board.length).to be_eql(9)
    end

    it 'has empty spaces' do
      expect(ttt_board.board.all? { |sq| sq == ' ' }).to be true
    end
  end

  describe '#selected_moves' do
    it 'is an array' do
      expect(ttt_board.board).to be_an Array
    end

    it 'is empty' do
      expect(ttt_board.selected_moves.empty?).to be true
    end
  end

  describe '#valid_square?' do
    it 'returns square, if square is not choosen' do
      expect(ttt_board.valid_square?(1)).to be_eql(1)
    end

    it 'returns false, if square has been selected' do
      ttt_board.set_a_square(0, 'X')
      ttt_board.valid_square?(0)
      expect(ttt_board.valid_square?(0)).to be nil
    end
  end

  describe '#set_a_square' do
    it 'populates the selected_moves array' do
      ttt_board.set_a_square(0, 'X')
      expect(ttt_board.board.index('X')).to be_eql(0)
    end

    it 'populates the selected_moves array' do
      ttt_board.set_a_square(0, 'X')
      expect(ttt_board.selected_moves.include?(0)).to be true
    end
  end

  describe '#display' do
    it 'should return a string' do
      expect(ttt_board.display).to be_an String
    end
  end

  describe '#win_or_draw' do
    it 'returns X when X wins' do
      ttt_board.set_a_square(0, 'X')
      ttt_board.set_a_square(1, 'X')
      ttt_board.set_a_square(2, 'X')
      expect(ttt_board.win_or_draw).to be_eql('X')
    end

    it 'returns O when O wins' do
      ttt_board.set_a_square(0, 'O')
      ttt_board.set_a_square(3, 'O')
      ttt_board.set_a_square(6, 'O')
      expect(ttt_board.win_or_draw).to be_eql('O')
    end

    it 'returns TIE when no Winner' do
      ttt_board.set_a_square(0, 'X')
      ttt_board.set_a_square(8, 'O')
      ttt_board.set_a_square(6, 'X')
      ttt_board.set_a_square(3, 'O')
      ttt_board.set_a_square(5, 'X')
      ttt_board.set_a_square(1, 'O')
      ttt_board.set_a_square(2, 'X')
      ttt_board.set_a_square(5, 'O')
      ttt_board.set_a_square(7, 'X')
      expect(ttt_board.win_or_draw).to be_eql('TIE')
    end
  end
end
