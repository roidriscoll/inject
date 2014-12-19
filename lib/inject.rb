# 1. re-open array class
# 2. subclass - use inheritance

class Array

  def my_inject(total = nil)
    copy = self.dup # create copy of array
    total = total || copy.shift # assign total to argument, or first element of array
    copy.each do |elem| #from the next available element in the array do
      total = yield total, elem
    end
    total
  end

end
