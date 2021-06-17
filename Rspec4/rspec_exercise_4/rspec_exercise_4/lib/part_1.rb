def my_reject(arr, &prc)
    new_arr = arr.select do |ele|
        if !prc.call(ele)
            ele
        end
    end
    new_arr
end #end of method

def my_one?(arr, &prc)
    cnt = 0
    arr.each do |ele|
        if prc.call(ele)
            cnt += 1
        end
    end
    if cnt == 1
        return true
    else
        return false
    end
end #end of method

def hash_select(hash, &prc)
    new_hash = Hash.new()
    hash.each do |k,v|
        if prc.call(k,v)
            new_hash[k] = v
        end
    end
    new_hash
end #end of mehotd

def xor_select(arr, prc1, prc2)
    new_arr = []
    arr.each do |ele|
        if prc1.call(ele) && !prc2.call(ele)
            new_arr << ele
        elsif prc2.call(ele) && !prc1.call(ele)
            new_arr << ele
        end
    end
    new_arr
end #end of method

def proc_count(val, arr)
    cnt = 0
    arr.each do |prc|
        if prc.call(val)
            cnt+=1
        end
    end
    cnt
end #end of method
