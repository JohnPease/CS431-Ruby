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

  end

  # returns the string in the whole tree that comes first alphabetically
  def firstAlphabetical

  end

  # takes a closure parameter and calls the closure with each string in the tree as an argument
  def iterate

  end

end