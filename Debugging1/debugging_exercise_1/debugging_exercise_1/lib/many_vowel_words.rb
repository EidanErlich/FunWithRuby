# Debug this code to pass rspec! There are 2 mistakes to fix.

# Write a method, many_vowel_words, that accepts a sentence string as an arg. 
# The method should return a new sentence containing only the words that contain two or more vowels.

require "byebug"

def many_vowel_words(sentence)
    words = sentence.split(" ")
    new_words = []

    new_words = words.select do |word|
        num_vowels = num_vowels(word)
        if num_vowels >= 2
            new_words << num_vowels
        end
    end

    new_words = new_words.join(" ")
    new_words
end

def num_vowels(word)
    vwl = "aeiou"
    count = 0
    word.each_char do |char|
        count += 1 if vwl.include?(char.downcase)
    end
    return count
end

p many_vowel_words("hello world, how are you")