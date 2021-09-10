require_relative 'cell.rb'

class Board

    attr_reader :cells
  
    def initialize(cells = default_grid)
      @cells = cells
    end
  
    def get_cell(x,y)
      cells[y][x]
    end
  
    def set_cell(x, y, value)
      get_cell(x, y).value = value
    end
  
    private
  
    def default_grid
      Array.new(3) {Array.new(3){Cell.new()}}
    end
  
  end