require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player

    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (n*n)/2
    end #end of initialize

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        puts @board.print
    end #end of start_game

    def lose?
        if @remaining_misses <= 0
            puts "you lose"
            return true
        else
            return false
        end
    end #end of lose?

    def win?
        if @board.num_ships == 0
            puts "you win"
            return true
        else
            return false
        end
    end #end of win?

    def game_over?
        return true if self.win? || self.lose?
        return false
    end #end of game_over?

    def turn
        pos = @player.get_move
        if @board.attack(pos) == false
            @remaining_misses -= 1
        end
        @board.print
        puts @remaining_misses
        
        
    end #end of turnddk
end #end of battleship class
