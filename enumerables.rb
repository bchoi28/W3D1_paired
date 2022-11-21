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


end

return_value = [1, 2, 3].my_each do |num|
 puts num
end.my_each do |num|
 puts num
end