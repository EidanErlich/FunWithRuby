# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span 
        if self.length == 0
            return nil
        else
            return self.max-self.min
        end
    end #end of span

    def average 
        if self.length == 0
            return nil
        else
            return ((self.sum)*1.00)/self.length
        end
    end #end of average

    def median
        
        if self.length == 0
            return nil
        end
        if self.length.even? == true
            mid = (self.length)/2.0
            return (self.sort[mid-1]+self.sort[mid])/2.0
        else
            mid = (self.length-1)/2
            return self.sort[mid]
        end
    end #end of median

    def counts 
        hash = Hash.new(0)
        self.each do |ele|
            hash[ele] += 1
        end
        return hash
    end #end of counts

    def my_count(val)
        cnt = 0;
        self.each do |ele|
            if ele == val
                cnt+=1
            end
        end
        return cnt
    end #end of my_count
    
    def my_index(val)
        if self.include?(val) == false
            return nil
        else
            self.each_with_index do |ele, i|
                if ele == val
                    return i
                end
            end
        end
    end #end of my_index

    def my_uniq
        arr = []
        self.each do |ele|
            if !arr.include?(ele)
                arr << ele
            end
        end
        return arr
    end #end of my_uniq

    def my_transpose
        lng = self.length
        arr = Array.new(lng){Array.new(lng)}
        self.each_with_index do |ele1, i|
            self.each_with_index do |ele2, j|
                arr[i][j] = self[j][i]
            end #end of do ele2, j
        end #end of do ele1, i
        return arr
    end #end of my_tranpose
end