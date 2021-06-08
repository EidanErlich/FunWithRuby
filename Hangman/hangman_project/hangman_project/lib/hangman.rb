class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end #end of self.random_word 

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end #end of initialize 
  
  def guess_word
    @guess_word
  end #end of guessword

  def attempted_chars
    @attempted_chars
  end #end of attempted_chars

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end #end of remaining_incorrect_guesses

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    return false
  end #end of already_attempted?

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |ele, i|
      if ele == char
        arr << i
      end
    end #end of do char, i
    return arr
  end #end of get_matching_indices

  def fill_indices(char, arr)
    arr.each do |ele|
      @guess_word[ele] = char
    end
  end #end of fill_indices

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << char

    matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)

    @remaining_incorrect_guesses -= 1 if matches.empty?

    return true
  end #end of try_guess

  def ask_user_for_guess
    p "Enter a char:"
    self.try_guess(gets.chomp)
  end #end of ask_user_for_guess

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end #end of win?

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end 
  end #end of lose?

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end #end of game_over

end #end of class

