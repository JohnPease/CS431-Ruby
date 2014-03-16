# John Pease, CS431, Homework 7
class MyVector

  @array

  def initialize(array)
    @array=array
  end

  def length
    @array.length
  end

  def *(a)
    if a.instance_of?(MyVector)
      #return inner product of vector and a
      if @array.length != a.length
        raise ArgumentError, 'Vector is incorrect size'
      end
      r = 0
      @array.zip(a).each do |x,y|
        r += x*y
      end
    elsif a.instance_of?(MyMatrix)

      if (a.length != @array.length)
        raise ArgumentError, 'Matrix has incorrect number of rows'
      end

      len = a[0].length
      a.each do |x|
        if (x.length != len)
          raise ArgumentError, 'Matrix argument has inconsistent columns'
        end
        len = x.length
      end

      @array.each do |i|
        res << 0
      end
      arrayCount = 0
      aCount = 0
      @array.each do |i|
        a[arrayCount].foreach do |z|
          res[aCount] += i * a[arrayCount][aCount]
          aCount+=1
        end
        arrayCount+=1
      end
      res

    else
      raise ArgumentError, 'Wrong type for MyVector *'
    end
  end

  def to_s
    x = ''
    @array.each do |e|
      x = x.concat(e.to_s).concat(' ')
    end
    return x
  end

end


class MyMatrix

  @matrix = Array.new
  #Takes [[],[],[]], converts into
  #[MyVector, MyVector, MyVector] and
  #stores it in matrix
  def initialize(a)
    @matrix = Array.new(a.length)
    a.each do |i|
      puts i.to_s
      # @matrix << MyVector.new(i)
    end
  end

  def transpose
    # ????
  end

  def *(a)
    # valid = # cols here == # rows in a
    if !(@matrix[0].length == a.length)
      return
    end
    # multiply matrices
    @matrix.each do |i|
      aFixed.each do |j|
        res << i*j
      end
    end
    @matrix = res
  end

  def to_s
    x = ''
    @matrix.each do |e|
      x=x.concat(e.to_s)
    end
    return x
  end
end

v = MyVector.new([1,2,3])
puts v.to_s

m = MyMatrix.new([[1,2],[3,4],[5,6]])
puts m.to_s
