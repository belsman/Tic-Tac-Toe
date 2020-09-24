class Board
  attr_reader :board, :selected_moves

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    @selected_moves = []
  end

  def valid_square?(square)
    return square if !@selected_moves.include?(square) && square.between?(0, 8)
  end

  def set_a_square(idx, game_piece)
    @board[idx] = game_piece
    @selected_moves.push(idx)
  end

  def display
    %(
    #{@board[0]} | #{@board[1]} | #{@board[2]}
    ---------
    #{@board[3]} | #{@board[4]} | #{@board[5]}
    ---------
    #{@board[6]} | #{@board[7]} | #{@board[8]}
      )
  end

  def win_or_draw
    winning_numbers = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    status = nil
    winning_numbers.each do |n|
      if !@board[n[0]].empty? && @board[n[0]] == @board[n[1]] && @board[n[1]] == @board[n[2]]
        status = @board[n[0]]
        break
      end
    end

    status = 'TIE' if status.nil? && @selected_moves.length == 9

    status
  end
end
