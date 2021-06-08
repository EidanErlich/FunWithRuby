def my_map(arr, &block)
    arr.each_with_index do |ele, i|
        arr[i] = block.call(ele)
    end #end of do ele, i
    arr
end #end of method

def my_select(arr, &block)
    new_arr = arr.map do |ele|
        ele if block.call(ele)
    end #end fo ele
    new_arr.compact
end #end of method

def my_count(arr, &block)
    cnt_arr = arr.map do |ele|
        ele if block.call(ele)
    end #end of do ele
    cnt_arr.compact.length
end #end of method

def my_any? (arr, &block)
    new_arr = arr.map do |ele| 
        ele if block.call(ele)
    end #end of do ele
    if new_arr.compact.length >= 1
        true
    else
        false
    end #end of >= 1
end #end of method

def my_all?(arr, &block)
    new_arr = arr.map do |ele|
        ele if block.call(ele)
    end #end of mpa do ele
    if new_arr.compact.length == arr.length
        true
    else
        false
    end #end of check length
end #end of method

def my_none?(arr, &block)
    new_arr = arr.map do |ele| 
        ele if block.call(ele)
    end #end of do ele
    if new_arr.compact.length == 0
        true
    else
        false
    end #end of = 0
end #end of method