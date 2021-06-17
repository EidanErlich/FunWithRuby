def no_dupes?(arr)
    single = []
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end
    hash.each do |k,v|
        if v == 1
            single << k
        end
    end
    single

end #end of no_dupes?

def no_consecutive_repeats?(arr)
    arr.each_with_index do |ele, i|
        if i != arr.length
            return false if ele == arr[i+1]
        end
    end
    return true

end #end of method

def char_indices(str)
    hash = Hash.new{|k,v| k[v]=[]}
    str.each_char.with_index do |char, i|
        hash[char] << i
    end
    hash
end #end of method

def longest_streak(str)
    streak = ""
    hash = Hash.new(0)
    str.each_char.with_index do |char, i|
        if i != str.length
            if hash[char] == 0
                hash[char] += 1
            end
            if char == str[i+1]
                hash[char]+=1
            end #if consecutive matches
        end #in the string length
    end #do char i

    tr = []
    mkvp = hash.max_by{|k,v| v}

    hash.each do |k,v|
            if v >= mkvp[1]
                tr << k
            end
        end #end of do k,v
        
    if mkvp != nil
        if tr.length == 0
            mkvp[1].times do 
                streak += mkvp[0]
            end
        else
            mkvp[1].times do 
                streak += tr[-1]
            end
        end
    end
    streak
end #end of method

def prime?(num)
    return false if num < 2
    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end
    return true
end

def bi_prime?(num)
    fctr = []
    (1..num).each do |i|
        if num % i == 0 && prime?(num / i)
            fctr << num / i
        end
    end
    return false if fctr.length > 2
    sum = 1
    fctr.each do |ele|
        sum*= ele
    end
    return false if sum != num
    return true
end #end of method

def vigenere_cipher(message, keys)
    abc = "abcdefghijklmnopqrstuvwxyz"

    new_key = []
    while new_key.length < message.length
        keys.each do |ele|
            new_key << ele
        end
    end

    tst = Array.new(message.length) {Array.new(2) {0}}
    i = 0
    message.each_char do |ele|
        tst[i][0] = ele 
        tst[i][1] = new_key[i]
        i+=1
    end
    
    arr = tst.map.each_with_index do |ele, i|
        idx = ele[1] + abc.index(ele[0])
        if idx > 26
            idx = idx-26
        end
        idx
        
    end #end of do ele, i
    word = arr.map.each do |ele|
        abc[ele]
    end
    word.join("")
end #end vigenere_cipher

def vowel_rotate(str)
    new_str = str[0..-1]
    vwl = "aeiou"
    vwl_idx = (0...str.length).select { |i| vwl.include?(str[i]) }
    new_vwl_idx = vwl_idx.rotate(-1)

    vwl_idx.each_with_index do |vwl_indx, i|
        nv = str[new_vwl_idx[i]]
        new_str[vwl_indx] = nv
    end
    new_str
end #end of method

class String
    def select(&blc)
        return "" if blc == nil
        str = ""
        self.each_char do |char|
            if blc.call(char)
                str += char
            end
        end
        str
    end #end of select method

    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = proc.call(char, i)
        end
        self
    end #end of map method
end #end of String class

def multiply(a,b)
    return 0 if b == 0
    if b < 0
        -(a+multiply(a, (-b)-1))
    else
        a+multiply(a,b-1)
    end
    
end #end of multiply method


def lucas_sequence(lng)
    return [] if lng == 0
    return [2] if lng == 1
    return [2,1] if lng == 2
    seq = lucas_sequence(lng-1)
    next_ele = seq[-1] + seq[-2]
    seq << next_ele
    seq
end #end of lucasSequence 


def prime_factorization(num)
    ftr = []
    (1..num).each do |i|
        if num % i == 0 && prime?(num / i)
            ftr << num / i            
            if num / i == 2
                ftr << num/i
            end
        end
    end
    ftr.reverse

end #end of prime_factorization
p prime_factorization(2017)     # => [2, 2, 3, 5]

