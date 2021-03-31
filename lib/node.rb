# lib/node.rb

class Node
  attr_accessor :left, :right, :value

  def initialize
    @value = nil
    @left = nil
    @right = nil
  end
end
