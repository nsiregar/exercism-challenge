# frozen_string_literal: true

class Board
  EMPTY_STRING = ''
  SPACE = ' '
  CHAR_X = 'X'
  CHAR_O = 'O'

  def initialize(game)
    @game = game.map { |row| row.split(SPACE) }
    @o_board = get_indexes(@game, CHAR_O)
    @x_board = get_indexes(@game.transpose, CHAR_X)
  end

  def winner
    return CHAR_O if winner? @o_board
    return CHAR_X if winner? @x_board

    EMPTY_STRING
  end

  private

  def get_indexes(board, player)
    board.map do |row|
      player_pos = row.map.with_index do |cell, idx|
        idx if cell == player
      end
      player_pos.compact
    end
  end

  def winner?(board)
    board.first.any? { |start| valid_path?(board, 0, start) }
  end

  def valid_path?(board, row, col, path = [])
    return true if row == board.length - 1

    next_move = generate_moves(row, col).find do |next_row, next_col|
      board[next_row].member?(next_col) && !path.member?([next_row, next_col])
    end

    return false if next_move.nil?

    valid_path?(board, *next_move, path << next_move)
  end

  private

  def generate_moves(row, col)
    [[row + 1, col],
     [row + 1, col - 1],
     [row, col + 1],
     [row, col - 1],
     [row - 1, col],
     [row - 1, col + 1]]
  end
end
