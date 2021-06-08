# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
    max = 0
    (0...num).each do
        if prime?(num, max) > max
            max = prime?(num, max)
        end
    end
    max
end #end of largest_prime_factor method


def prime?(num, max)
    return num if num <= 2

    (2...num).each do |factor|
        if num % factor == 0 && factor != max
            return factor
        end
    end
    return num
end

def unique_chars?(str)
    hash = Hash.new(0)

    str.each_char do |char|
        hash[char] += 1
    end #end of do char
    hash.each_value do |v|
        if v > 1
            return false
        end
    end #end of do v
    return true
end #end of unique_chars? method


def dupe_indices(arr)
    hash = Hash.new(0)
    new_hash = Hash.new([])

    arr.each do |ele|
        hash[ele] += 1
    end #end of do ele

    hash.each do |k,v|
        if v > 1
            new_hash[k] = []
        end
    end #end of do k,v

    i = 0
    arr.each_with_index do |char, j|
        if new_hash.include?(char)
            new_hash[char][i] = arr.index(char)
            arr[j] = nil
            i+=1
        end #end of new_hash.include?
    end #end of char, j

    new_hash.each do |k,v|
        v.delete(nil)
    end #end of each do k,v

    return new_hash
end #end of dup_indices method

def ana_array(arr1, arr2)
    if arr1.length != arr2.length
        return false
    end #end of check if arr is same length
    arr1.each do |ele|
        if arr2.include?(ele) == false
            return false
        end
    end #end of do ele

    arr2.each do |ele|
        if arr1.include?(ele) == false
            return false
        end
    end #end of do ele
    return true
end #end of ana_array method