# lib/trees.rb
require_relative('./node')

# Points left and right nodes to the next level in the array halved array
class Tree
  attr_accessor :root

  def initialize(array)
    @root = nil
    build_tree(array)
  end

  # Divide and conquer algorithm
  def build_tree(element)
    return element if element.size == 1

    sorted = element.sort.uniq

    # recursive
    mid = sorted.size / 2
    left = sorted[0...mid]
    right = sorted[mid...sorted.size]

    node = Node.new
    node.value = sorted[mid]
    node.left = build_tree(left)
    node.right = build_tree(right)
    @root = node if @root.nil?
    p @root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
