class Array

    def my_each(&prc)
        prc.call(self)
    end


end

return_value = [1, 2, 3].my_each do |num|
 puts num
end

return_value.my_each do |num|
 puts num
end