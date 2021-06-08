def all_words_capitalized?(arr)
    arr.all? do |word|
        word.each_char.with_index do |char, i|
            if i == 0
                if char != char.upcase
                    return false
                end
            else
                if char != char.downcase
                    return false
                end
            end
        end
        true
    end
end

def no_valid_url?(arr)
    valid_end = ['.com', '.net', '.io', '.org']
    arr.none? do |url|
        valid_end.any? {|ending| url.end_with?(ending)}
    end #end of none do url
end #end of method

def any_passing_students?(arr)
    arr.any? do |student|
        avg = student[:grades].sum(0.0)/student[:grades].size
        avg > 75
    end
end #end of method

p any_passing_students?([
    { name: "Alvin", grades: [70, 50, 75] },
    { name: "Warlin", grades: [80, 99, 95] },
    { name: "Vlad", grades: [100] },
  ])