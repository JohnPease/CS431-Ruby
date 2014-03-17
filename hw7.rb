# John Pease, CS431, Homework 7
class MyVector

  @array = Array.new

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
      for i in 0..@array.length-1 do
        r += @array[i] * a.get_index(i)
      end
      return r

    elsif a.instance_of?(MyMatrix)

      if a.length != @array.length
        raise ArgumentError, 'Matrix has incorrect number of rows'
      end

      len = a.get_index(0).length
      a.get_matrix.each do |x|
        if x.length != len
          raise ArgumentError, 'Matrix argument has inconsistent columns'
        end
        len = x.length
      end

      r = Array.new
      @array.each do |i|
        r << 0
      end
      #a is a matrix
      arrayCount = 0
      aCount = 0

      @array.each do |i|
        a.get_index(arrayCount).get_vector.each do |z|
          #r[aCount] += i * a[arrayCount][aCount]
          puts '**** a[arrayCount][aCount]: ' + a.get_index(arrayCount).get_index(aCount).to_s
          puts 'r[aCount]: ' + r[aCount].to_s
          puts 'i: ' + i.to_s + ', aCount: ' + aCount.to_s + ', arrayCount: ' + arrayCount.to_s
          r[aCount] += i * a.get_index(arrayCount).get_index(aCount)
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
    x
  end

  def get_index(i)
    @array[i]
  end

  def get_vector
    @array
  end

end


class MyMatrix

  @matrix = Array.new
  #Takes [[],[],[]], converts into
  #[MyVector, MyVector, MyVector] and
  #stores it in matrix
  def initialize(a)
    @matrix = Array.new
    a.each do |i|
      @matrix << MyVector.new(i)
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
      x << "\n"
      x=x.concat(e.to_s)
    end
    x
  end

  def length
    @matrix.length
  end

  def get_index(i)
    @matrix[i]
  end

  def get_matrix
    @matrix
  end
end

# Vector tests
v = MyVector.new([1,2,3])
puts 'v = ' + v.to_s

v1 = MyVector.new([2,3,4])
#puts 'v1 = ' + v1.to_s
#puts 'v * v1 = ' + (v * v1).to_s
#puts (v * v1).class

m = MyMatrix.new([[1,2],[1,2],[1,2]])
puts 'm =  ' + m.to_s
#puts 'v * m = ' + (v * m).to_s
(v * m)

m1 = MyMatrix.new([[1,2,3], [2,3,4]])
#puts 'm1 = ' + m1.to_s + '\n'
#puts 'm * m1 = ' + (m * m1).to_s
#puts 'm1 * m = ' + (m1 * m).to_s
