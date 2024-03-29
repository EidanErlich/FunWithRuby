# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]
def all_vowel_pairs(words)
    pairs = []
    vwl = ["a", "e", "i", "o", "u"]
    words.each_with_index do |word1, idx1|
        words.each_with_index do |word2, idx2|
            pair = word1 + " " + word2
            pairs << pair if idx2>idx1 && vwl.all? {|ltr| pair.include?(ltr)}
            end
        end
        pairs
end #end of method



# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
    return false if num <= 2
    (2...num).each do |i|
        return true if num % i == 0
    end
    return false
end



# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
    str = str.split(" ").join("").split("")
    new_str = []
    newBi = []
    str.each_with_index do |char, i|
        if i == 0
            new_str << char+str[1]
        elsif i != str.length-1
            new_str << char+str[i+1]
        end #end of i index checl
    end #end of do char
    
    bigrams.each do |ltr|
        if new_str.include?(ltr)
            newBi << ltr
        end #end of if include
    end #end of do ltr
    newBi
end #end of method


class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        hash = Hash.new
        prc ||= Proc.new {|k, v| k == v}
        self.each do |k,v|
            hash[k] = v if prc.call(k, v)
        end
        hash

    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        sub = []
        (0..self.length-1).each do |n|
            (n..self.length-1).each do |i|
                sub << self[n..i]
            end
        end
        if length != nil
            sub = sub.select {|ele| ele.length == length}
        end
        sub
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        abc = "abcdefghijklmnopqrstuvwxyz"
        arr = self.split("")
        new_arr = []
        new_arr = arr.map do |ltr|
            idx = abc.index(ltr)
            nm = idx+num
            if nm > 26
                nm = nm-26
            end
            abc[nm]
        end
        new_arr.join("")

    end
end

