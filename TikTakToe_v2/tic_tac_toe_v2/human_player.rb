class HumanPlayer

    def initialize(val)
        @mark = val
    end

    attr_reader :mark

    def get_position
        puts "Player #{mark.to_s}, enter two numbers representing a position"
        pos = gets.chomp.split(" ").map(&:to_i)
        raise "nah fam try again :-(" if pos.length != 2
        pos
    end

end #end of class