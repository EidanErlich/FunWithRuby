def reverser(str, &block)
    str = str.split("")
    reversed = []
    str.size.times { reversed << str.pop }
    str = reversed.join("")
    block.call(str)
end #end of method


def word_changer(snt, &block)
    snt = snt.split(" ")
    new_snt = snt.map do |word|
        block.call(word)
    end #end of map do word
    new_snt.join(" ")
end #end of method


def greater_proc_value(num, prc1, prc2)
    num1 = prc1.call(num)
    num2 = prc2.call(num)
    return num1 if num1>num2
    return num2 if num2>num1
end #end of method


def and_selector(arr, prc1, prc2)
    new_arr = arr.map do |ele|
        ele if prc1.call(ele) && prc2.call(ele)
    end #end of map do ele
    new_arr.compact
end #end of method


def alternating_mapper(arr, prc1, prc2)
    new_arr = arr.each_with_index.map do |ele, i|
        if i % 2 == 0
            prc1.call(ele)
        else
            prc2.call(ele)
        end
    end
    new_arr
end #end of method

half = Proc.new { |n| n / 2.0 }
times_thousand = Proc.new { |n| n * 1000 }
p alternating_mapper([1,10,4,7,5], half, times_thousand)