# John Pease, CS431, Homework 8

class Leaf
  # takes a string
  def initialize(string)
    @leaf = string
  end

  # return the string in the leaf
  def concatAll
    @leaf
  end

  # return the string in the leaf
  def firstAlphabetical
    @leaf
  end

  # takes a closure parameter and calls the closure with the string in the leaf as the argument
  def iterate(itr)
    itr.call(@leaf)
  end

end

class BinaryNode
  # takes 2 arguments, both are either leaves or nodes, these are the binary node's children
  def initialize(x,y)
    @left = x
    @right = y
  end

  # returns a single string that is all of a tree's strings concatenated left to right
  def concatAll
    @left.concatAll.concat(@right.concatAll)
  end

  # returns the string in the whole tree that comes first alphabetically
  def firstAlphabetical
    if (@left.firstAlphabetical.casecmp(@right.firstAlphabetical) == -1)
      @left
    else
      @right
    end
  end

  # takes a closure parameter and calls the closure with each string in the tree as an argument
  def iterate(cl)

  end

end

def test_tree
  l0 = Leaf.new "What "
  l1 = Leaf.new "a "
  l2 = Leaf.new "great "
  l3 = Leaf.new "day"
  t0 = BinaryNode.new(l0,l1)
  t1 = BinaryNode.new(t0,l2)
  t2 = BinaryNode.new(t1,l3)

  puts "tree concatenated:\t" + t2.concatAll
  puts
  puts "tree first alphabetical:\t" + t2.firstAlphabetical
  puts
  puts "tree iterated:"
  puts
  i = 0
  t2.iterate(lambda { |s| i=i+1; puts i.to_s + ": " + s })
end

test_tree