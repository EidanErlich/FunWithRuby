# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def prime?(num)
    return false if num < 2
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    return true
end

def least_common_multiple(num_1, num_2)
    fctr1 = []
    fctr2 = []
    ftr = []
    (1..num_1).each do |i|
        if num_1 % i == 0 && prime?(num_1 / i)
            fctr1 << num_1 / i
            if num_1 /i == 2
                fctr1 << i
            end
        end
    end
    (1..num_2).each do |i|
        if num_2 % i == 0 && prime?(num_2 / i)
            fctr2 << num_2 / i
            if num_2 /i == 2
                fctr2 << i
            end
        end
    end
    fctr1.each do |ele|
        if fctr2.include?(ele)
            ftr << ele
            fctr2.delete(ele)
        else
            ftr << ele
            fctr1.delete(ele)
        end
    end
    fctr2.each do |ele|
        if fctr1.include?(ele)
            ftr << ele
            fctr1.delete(ele)
        else
            ftr << ele
            fctr2.delete(ele)
        end
    end
    sum = 1
    ftr.each {|ele| sum*=ele}
    sum
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    str = str.split("")
    bi = []
    str.each_with_index do |char, i|
        if i == 0
            bi << char+str[1]
        elsif i != str.length-1
            bi << char+str[i+1]
        end #end of i index checl
    end #end of do char
    
    hash = Hash.new(0)
    bi.each do |ele|
        hash[ele] += 1
    end
    max = 0
    bg = ""

    hash.each do |k,v|
        if v > max
            bg = k
            max = v
        end
    end
    bg
end

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new_hash = Hash.new
        self.each do |k,v|
            new_hash[v] = k
        end
        new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        arr = self.combination(2).to_a
        cnt = 0
        arr.each do |ele|
            if ele.sum == num
                cnt+= 1 
            end
        end
        cnt
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new{ |a,b| a<=> b}

        sorted = false
        while !sorted 
            sorted = true
            (0...self.length-1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    sorted = false
                    self[i], self[i+1] = self[i+1], self[i]
                end
            end
        end
        self
    end
end
