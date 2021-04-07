#!/usr/bin/env ruby

# Points to other left or right nodes
class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil)
    @data = data
    @left = nil
    @right = nil
  end
end
