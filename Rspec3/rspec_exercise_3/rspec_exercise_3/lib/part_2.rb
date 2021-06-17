def element_count(arr)
    hash = Hash.new(0)

    arr.each do |ele|
        hash[ele] += 1
    end
    hash
end #end of method

def char_replace!(str, hash)
    str.each_char.with_index do |char, i|
        if hash.has_key?(char)
            str[i] = hash[char]
        end
    end
end #end of method

def product_inject(arr)
    arr.inject(1, :*)
end #end of method