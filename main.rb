require 'pry'
require_relative 'board.rb'
require_relative 'cell.rb'
require_relative 'player.rb'


class Game

  attr_reader :board, :current_player_id

  def initialize(player_1, player_2,board = Board.new())
    @board = board
    @players = [player_1.new(self,"X",1),player_2.new(self,"O",2)]
    @current_player_id = 0
  end

  def select_position!
    @game.print_board
      while true
        puts "Select your #{marker} poisiton"
        selection = gets.to_i
        return selection if @game.free_positions.include?(selection) 
        puts  "position #{selection} position is not available"
      end
  end

  def player_marker(player)
    binding.pry
    position = select_position!
    grid_position(position)
    puts "Player #{player} selects #{player.marker} in position #{position}"
  end

  def board_full?
    free_positions.empty?
  end


  def switch_players
    @other_player = @current_player
  end

  def other_player_id
    1-@current_player_id
  end

  def current_player
    @players[current_player_id]
  end

  def play

    while true
      binding.pry
      player_marker(current_player)

      if player_won?(current_player)
        puts "#{current_player} is the winner"
        print_board
      elsif board_full?
        puts "It's a draw"
        print_board
      end

      switch_players
    end

  end

  def grid_position(number)
    case number
    when 1
      board.set_cell(0, 0, current_player.marker)
    when 2
      board.set_cell(1, 0, current_player.marker)
    when 3
      board.set_cell(2, 0, current_player.marker)
    when 4
      board.set_cell(0, 1, current_player.marker)
    when 5
      board.set_cell(1, 1, current_player.marker)
    when 6
      board.set_cell(2, 1, current_player.marker)
    when 7
      board.set_cell(0, 2, current_player.marker)
    when 8
      board.set_cell(1, 2, current_player.marker)
    when 9
      board.set_cell(2, 2, current_player.marker)
    end
  end

  def player_won?(player)
    if (board.cells[0][0].value && board.cells[0][1].value && board.cells[0][2].value) == player.marker
      return true
    elsif (board.cells[1][0].value && board.cells[1][1].value && board.cells[1][2].value) == player.marker
      return true
    elsif (board.cells[2][0].value && board.cells[2][1].value && board.cells[2][2].value) == player.marker
      return true
    elsif (board.cells[0][0].value && board.cells[1][0].value && board.cells[2][0].value) == player.marker
      return true
    elsif (board.cells[0][1].value && board.cells[1][1].value && board.cells[2][1].value) == player.marker
      return true
    elsif (board.cells[0][2].value && board.cells[1][2].value && board.cells[2][2].value) == player.marker
      return true
    elsif (board.cells[0][0].value && board.cells[1][1].value && board.cells[2][2].value) == player.marker
      return true
    elsif (board.cells[0][2].value && board.cells[1][1].value && board.cells[2][0].value) == player.marker
  end


  def print_board
    col_sep = " | "
    row_sep = "--+---+--"
    label_pos = ->(pos){  @board[pos] ? @board[pos] : pos}
    row_for_display= ->(row){row.map(&label_pos).join(col_sep)}
    row_pos = [[1,2,3],[4,5,6],[7,8,9]]
    rows_for_display=row_pos.map(&row_for_display)
    puts rows_for_display.join("\n"+ row_sep +"\n")
  end




  def free_positions
    grid_position(select_position).select{|pos| }
  end


end
end



players = [Player, Player].shuffle
bla = Game.new(*players)
binding.pry
bla.play