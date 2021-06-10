class Board
    attr_reader :size
    def initialize (n)
        @n = n
        @grid = Array.new(n) {Array.new(n, :N)}             
        @size = n*n
    end #end of initialize

    def [](arr)
        r = arr[0]
        c = arr[1]
        @grid[r][c]
    end #end of []

    def []=(pos, v)
        r = pos[0]
        c = pos[1]
        @grid[r][c] = v
    end #end of []=

    def num_ships
        sum = 0
        @grid.each do |ele|
            ele.each do |sub_ele|
                if sub_ele == :S
                    sum+=1
                end
            end
        end
        sum
    end #end of num_ships

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end #end of attack

    def place_random_ships
        total_ship = @size*0.25
        while self.num_ships < total_ship
            rr = rand(0...@grid.length)
            rc = rand(0...@grid.length)
            pos = [rr,rc]
            self[pos] = :S
        end
    end #end of place_random_ships

    def hidden_ships_grid
        arr = @grid.map do |ele|
            ele.map do |sub_ele|
                if sub_ele != :X
                    sub_ele = :N
                else
                    sub_ele = :X
                end
            end
        end
        return arr
    end #end of hidden_ships_grid

    def self.print_grid(arr)
        arr.each do |row|
            puts row.join(" ")
        end
    end #end of print_grid

    def cheat
        Board.print_grid(@grid)
    end #end of cheat

    def print
        Board.print_grid(hidden_ships_grid)
    end #end of print

end #end of Board Class
