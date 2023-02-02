require 'board'
require 'player'
class Game

    def initialize
      @board = Board.new
      @current_player = ""
      @winner = false
      @turn = 0
    end

    def player_init
      puts (" " * 45) + "Bonjour, quel est le nom du joueur 1? "
      name_1 = gets.chomp
      puts (" " * 45) +"Quel est le nom du joueur 2? "
      name_2 = gets.chomp
      [name_1, name_2]
    end

    def player_round
      @current_player = @current_player == @player1 ? @player2 : @player1
    end

    def turn
      puts
      puts (" " * 48) + ("-" * 20)
      puts (" " * 48) + "C'est à #{@current_player.name} de jouer: "
      choice = gets.chomp.to_i
      if @current_player.move(choice) != false
        @winner = @current_player if @current_player.winner?
        @turn += 1
        player_round
      end
    end

    def perform
      names = player_init
      @player1 = Player.new(names[0], :x, @board)
      @player2 = Player.new(names[1], :o, @board)
      @current_player = @player1
      @board.show_board
      turn until @winner || @turn == 9
      if @winner
        puts (" " * 45) + "#{@winner.name} gagne la partie! "
      else
        puts (" " * 50) + "Match nul!"
      end
    end


  
  end