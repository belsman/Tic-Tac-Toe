require './lib/game'
require './lib/board'

describe Game do
  let(:game) { Game.new(Board.new, 'player #1', 'player #2') }

  describe '#game_piece' do
    it 'assigns the first player X' do
      expect(game.game_piece).to be_eql('X')
    end
  end

  describe '#current_player' do
    it 'should display player #1 as current player' do
      expect(game.current_player).to be_eql('player #1')
    end
  end

  describe '#win_draw' do
    it 'returns O when O wins' do
      game.board.set_a_square(0, 'O')
      game.board.set_a_square(3, 'O')
      game.board.set_a_square(6, 'O')
      expect(game.win_draw).to be_eql('O')
    end

    it 'returns X when X wins' do
      game.board.set_a_square(2, 'X')
      game.board.set_a_square(5, 'X')
      game.board.set_a_square(8, 'X')
      expect(game.win_draw).to be_eql('X')
    end

    it 'returns TIE when no Winner' do
      game.board.set_a_square(0, 'X')
      game.board.set_a_square(8, 'O')
      game.board.set_a_square(6, 'X')
      game.board.set_a_square(3, 'O')
      game.board.set_a_square(5, 'X')
      game.board.set_a_square(1, 'O')
      game.board.set_a_square(2, 'X')
      game.board.set_a_square(5, 'O')
      game.board.set_a_square(7, 'X')
      expect(game.win_draw).to be_eql('TIE')
    end
  end
end
