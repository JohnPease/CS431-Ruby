# John Pease, CS431, Ruby Homework 7
class MyVector

  def initialize(array)
    @childArray=array
  end

  def length
    @childArray.length
  end

  def *(a)
    if a.instance_of?(MyVector)

      if @childArray.length != a.length
        raise ArgumentError, 'Vector is incorrect size'
      end

      r = 0
      for i in 0..@childArray.length-1 do
        r += @childArray[i] * a.get_index(i)
      end
      r

    elsif a.instance_of?(MyMatrix)

      if a.length != @childArray.length
        raise ArgumentError, 'Matrix has incorrect number of rows'
      end

      len = a.get_index(0).length
      a.get_matrix.each do |x|
        if x.length != len
          raise ArgumentError, 'Matrix argument has inconsistent columns'
        end
        len = x.length
      end

      r = Array.new(len, 0)
      for i in 0..len-1 do
        for j in 0..@childArray.length-1 do
          r[i] += @childArray[j] * a.get_matrix[j].get_index(i)
        end
      end

      return MyVector.new(r)
    else
      raise ArgumentError, 'Wrong type for MyVector *'
    end
  end

  def to_s
    x = ''
    @childArray.each do |e|
      x = x.concat(e.to_s).concat(' ')
    end
    x
  end

  def get_index(i)
    @childArray[i]
  end

  def get_vector
    @childArray
  end

end


class MyMatrix

  def initialize(a)
    @matrix = Array.new
    a.each do |i|
      @matrix << MyVector.new(i)
    end
  end

  def transpose
    tMatrix = Array.new(0)
    for i in 0..@matrix[0].length-1 do
      tArray = Array.new(0)
      for j in 0..@matrix.length-1 do
        tArray << @matrix[j].get_vector[i]
      end
      tMatrix << MyVector.new(tArray)
    end

    @matrix = tMatrix
  end

  def *(a)
    if @matrix[0].length != a.length
      raise ArgumentError, 'Incorrect sized matrices sent to *'
    end
    mat = Array.new(0)
    a.transpose
    # multiply matrices
    @matrix.each do |i|
      res = Array.new(0)
      a.get_matrix.each do |j|
        res << i*j
      end
      mat << res
    end
    a.transpose
    return MyMatrix.new(mat)
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
puts 'v1 = ' + v1.to_s
puts 'v * v1 = ' + (v * v1).to_s

m = MyMatrix.new([[1,2],[1,2],[1,2]])
puts 'm =  ' + m.to_s
puts 'v * m = ' + (v * m).to_s

m1 = MyMatrix.new([[1,2,3], [2,3,4]])
puts 'm1 = ' + m1.to_s + "\n"
puts 'm * m1 = ' + (m * m1).to_s
puts 'm1 * m = ' + (m1 * m).to_s