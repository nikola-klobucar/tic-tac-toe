class Player

    attr_reader :marker, :number
  
    def initialize(game, marker, number)
      @game = game
      @marker = marker
      @number = number
    end
  
  end