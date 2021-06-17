def proper_factors(num)
    arr = []
    (1...num).each do |val|
        if num % val == 0
            arr << val
        end
    end
    arr
end #end of method

def aliquot_sum(num)
    arr = proper_factors(num)
    arr.sum
end #end of method

def perfect_number?(num)
    sum = aliquot_sum(num)
    if num == sum
        return true
    else
        return false
    end
end #end of method

def ideal_numbers(n)
    cnt = 0
    num = 0
    arr = []
    while cnt != n
        if perfect_number?(num)
            arr << num
            cnt += 1
        end
        num += 1
        cnt =-1
    end
    arr
end #end of method