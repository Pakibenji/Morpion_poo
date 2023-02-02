# Classe définissant le plateau de jeu
class Board

    attr_accessor :cases

    def initialize
      @cases = ["1", "2", "3","4", "5", "6","7", "8", "9"]
    end

    def case_update(number, symbol)
      if cases?(number)
        self.cases[number - 1] = symbol.to_s
        show_board
      else
        puts (" " * 40 ) + "La case est déja prise, choisis en une autre."
        return false
      end
    end

    def show_board
      column_a = " " * 50 + self.cases[0..2].join(" " * 5)
      column_b = " " * 50 + self.cases[3..5].join(" " * 5)
      column_c = " " * 50 + self.cases[6..8].join(" " * 5)
      puts column_a
      puts 
      puts column_b
      puts
      puts column_c
    end
    
    def cases?(number)
      case_ = self.cases[number - 1]
      if case_ == "X" ||  case_ == "O"
        false
      else
        true
      end
    end
  
  end