def is_prime?(num)
    return false if num < 2
    (2...num).each do |i|
        return false if num % i == 0
    end
    return true
end #end of method

def nth_prime(n)
    i = n
    cnt = 0

    while i > 0
        cnt+=1
        if is_prime?(cnt)
            i -= 1
        end
        
    end
    cnt
end #end of method

def prime_range(min, max)
    arr = []
    (min..max).each do |num|
        if is_prime?(num)
            arr << num
        end
    end
    arr
end #end of method

p prime_range(4,20)