def select_even_nums(arr)
    arr.select(&:even?)
end #end of even nums method

def reject_puppies(arr_hash)
    arr_hash.reject do |hash|
        hash["age"] <= 2
    end #end of reject do hash
end #end of puppies method

def count_positive_subarrays(arr)
    arr.count do |sub|
        sub.sum > 0
    end #end of count do sub
end #end of subarray count method

def aba_translate(str)
    vwl = "aeiou"
    new_str = ""
    str.each_char.with_index do |char, i|
        new_str += char
        if vwl.include?(char)
            str[i] += "b" + char
            new_str+= "b" + char
        end
    end #end of do char
    new_str
end #end of translate method

def aba_array(arr)
    arr.map do |str|
        aba_translate(str)
    end #end of do str
end #end of aba arr method