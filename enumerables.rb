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

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)  
        end
        new_arr 
    end


    

end


# return_value = [1, 2, 3].my_each do |num|
#  puts num
# end.my_each do |num|
#  puts num
# end


a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []