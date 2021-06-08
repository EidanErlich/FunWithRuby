class GuessingGame
    def initialize(min, max) 
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end #end of initillize

    def num_attempts
        @num_attempts
    end #end of num_attemps

    def game_over
        @game_over
    end #end of game_over

    def game_over=
        @game_over = false
    end #end of game_over setter

    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            p "you win"
            @game_over = true
        else
            if num > @secret_num
                p "too big"
            elsif num < @secret_num
                p "too small"
            end #end of biger/smaller
        end #end of if you got num correct 
    end #end of check_num
    
    def ask_user 
        p "enter a number"
        guess = gets.chomp.to_i
        check_num(guess)
    end #end of ask_user
end
