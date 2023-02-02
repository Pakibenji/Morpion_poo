class Player

    attr_accessor :name, :symbol

    def initialize(name, symbol, board)
      @name = name
      @symbol = symbol
      @board = board
    end

    def move(case_)
      @board.case_update(case_, self.symbol.to_s)
    end

    def winner?
      wins = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
              [0, 4, 8], [2, 4, 6]]
      wins.each do |win|
        values = [cases[win[0]], cases[win[1]], cases[win[2]]]
        return true if values.include?(self.symbol.to_s) &&
        ((values[0] == values[1]) && (values[1] == values[2]))
      end
      false
    end
  
    def cases
      @board.cases
    end
  
  end