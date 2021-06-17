def zip(arr1, arr2=[], arr3=[])
    cnt = 1
    if arr2.length == arr1.length
        cnt+=1
    end
    if arr3.length == arr1.length
        cnt+=1
    end
    arr = Array.new(arr1.length) {Array.new(cnt)}
    arr.each_with_index do |sub_arr, idx|
        sub_arr.each_with_index do |ele, i|
            if i == 0
                arr[idx][i] = arr1[idx]
            elsif i === 1
                arr[idx][i] = arr2[idx]
            elsif i == 2
                arr[idx][i] = arr3[idx]
            end
        end
    end
    arr
end #end of method

def prizz_proc(arr, prc1, prc2)
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


def zany_zip(*arrays)
    length = arrays.map(&:length).max

    (0...length).map do |i|
        arrays.map {|arr| arr[i]}
    end
end #end of method

def maximum(array, &prc)
    return nil if array.empty?
    max = array.first
    array.each do |el|
        max = el if prc.call(el) >= prc.call(max)
    end
    max
end

def my_group_by(array, &prc)
    groups = Hash.new { |h, k| h[k] = [] }
    array.each do |el|
        key = prc.call(el)
        groups[key] << el
    end
    groups
end

def max_tie_breaker(array, tie_breaker, &prc)
    return nil if array.empty?
    max = array.first
    array.each do |el|
        result_el = prc.call(el)
        result_max = prc.call(max)
        if result_el > result_max
            max = el
        elsif result_el == result_max && tie_breaker.call(el) > tie_breaker.call(max)
            max = el
        end
    end
    max
end

def change_word(word)
    indices = vowel_indices(word)
    word[indices.first..indices.last]
end

def vowel_indices(word)
    vowels = 'aeiou'
    indices = []
    word.each_char.with_index do |char, i|
        indices << i if vowels.include?(char)
    end
    indices
end

def silly_syllables(sentence)
    words = sentence.split(' ')
    new_words = words.map do |word|
        num_vowels = vowel_indices(word).length
        if num_vowels < 2
            word
        else
            change_word(word)
        end
    end
    new_words.join(' ')
end
