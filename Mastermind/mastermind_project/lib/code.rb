class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end #end of valid_pegs?

  def self.random(length)
    arr = []
    length.times {arr << POSSIBLE_PEGS.keys.sample}
    Code.new(arr)
  end #end of random

  def self.from_string(str)
    Code.new(str.split(""))
  end #end of from_string

  def initialize(arr)
    if Code.valid_pegs?(arr)
      @pegs = arr.map(&:upcase)
    else
      raise_error
    end
  end #end of initialize

  def [](index)
    @pegs[index]
  end #end of []

  def length
    @pegs.length
  end #end of length

  def num_exact_matches(guess)
    cnt = 0
    guess.length.times do |i|
      cnt+=1 if guess[i] == self[i]
    end
    cnt
  end #end of num_exact_matches

  def num_near_matches(guess)
    code_dupe = self.pegs.dup
    guess_dupe = guess.pegs.dup

    guess_dupe.each_with_index do |peg, i|
      if peg == code_dupe[i]
        code_dupe[i] = nil
        guess_dupe[i] = nil
      end
    end
    code_dupe.delete(nil)
    guess_dupe.delete(nil)

    cnt = 0
    guess_dupe.each_with_index do |peg, i|
      if code_dupe.include?(peg)
        cnt += 1
        code_dupe.delete_at(code_dupe.index(peg))
      end
    end
    cnt


  end #end of num_near_matches

  def ==(other_code)
    return true if other_code.pegs == self.pegs
    return false
  end #end of ==

end #end of Code class
