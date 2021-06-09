require_relative "code"

class Mastermind

    def initialize(length)
        @secret_code = Code.random(length)
    end #end of initialize

    def print_matches(guess)
        p @secret_code.num_exact_matches(guess)
        p @secret_code.num_near_matches(guess)
    end #end of print_matches

    def ask_user_for_guess
        p "Enter a code"
        guess = Code.from_string(gets.chomp)
        print_matches(guess)
        @secret_code==guess
    end #end of ask_user_for_guess

end #end of Mastermind class
