class Game

    require_relative "board"
    require_relative "human_player"

    def initialize(mark1, mark2)
        @p1 = HumanPlayer.new(mark1)
        @p2 = HumanPlayer.new(mark2)
        @current_player = @p1
        @board = Board.new
    end #end of method

    def current_player
        @current_player
    end

    def switch_turn
        if @current_player == @p1
            @current_player = @p2
        else
            @current_player = @p1
        end
    end #end of method

    def play 
        while @board.empty_positions?
            @board.print
            @pos = @current_player.get_position
            @board.place_mark(@pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                puts "game over bitches"
                puts @current_player.mark.to_s + " is just built diffy cause he do be wining"
                return
            else
                switch_turn
            end
        end
        puts "game over"
        puts "its a fucking draw"
        puts "it do be like that sometimes"
    end

end #end of class