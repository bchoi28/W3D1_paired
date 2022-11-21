class Array
    #self = [1, 2, 3]
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])         # &prc = {|num| puts num}
            i += 1
        end
        self
    end

    # return_value = [1, 2, 3].my_each do |num|
    #  puts num
    # end.my_each do |num|
    #  puts num
    # end

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)  
        end
        new_arr 
    end


    # a = [1, 2, 3]
    # p a.my_select { |num| num > 1 } # => [2, 3]
    # p a.my_select { |num| num == 4 } # => []


    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if !prc.call(ele)  
        end
        new_arr 
    end

    # a = [1, 2, 3]
    # p a.my_reject { |num| num > 1 } # => [1]
    # p a.my_reject { |num| num == 4 } # => [1, 2, 3]

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele) == true
        end
        false
    end

    # a = [1, 2, 3]
    # p a.my_any? { |num| num > 1 } # => true
    # p a.my_any? { |num| num == 4 } # => false


    def my_all?(&prc)
        self.my_each do |ele|
            return false if prc.call(ele) == false
        end
        true
    end

    # a = [1, 2, 3]
    # p a.my_all? { |num| num > 1 } # => false
    # p a.my_all? { |num| num < 4 } # => true

    def my_flatten
        arr = []
        self.each do |ele|
            if ele.class == Array
                my_flatten
            else
                arr << ele
            end
        end
        arr
    end

    p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

end

