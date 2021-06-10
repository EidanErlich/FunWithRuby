class Player

    def get_move
        p 'enter a position with coordinates separated with a space like `4 7`'
        input = gets.chomp.split(" ")
        arr = input.map {|ele| ele.to_i}
        arr
    end #end of get_move

end
