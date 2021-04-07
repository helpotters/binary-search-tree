require_relative('./node')

# Creates and manages a binary tree
class Tree
  attr_accessor :root

  def initialize(inputs)
    @inputs = inputs.sort.uniq
    @root = build_tree(@inputs)
  end

  def build_tree(inputs)
    return nil if inputs.empty?

    # Divide and conquer algorithm
    mid = inputs.size / 2
    # Everything between +1 mid and the last value

    node = Node.new(inputs[mid])

    node.left = build_tree(inputs[0...mid])
    node.right = build_tree(inputs[(mid + 1)..inputs.size]) # Does not include duplicate value mid

    node
  end

  def insert(value, node = root)
    return nil if value == node.data

    if value > node.data
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
    else # value < node.data
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    end
  end

  def delete(value, node = find(value))
    parent = parent_node(value)

    if node.left.nil? && node.right.nil? # no children
      delete_leaf(value, parent)
    elsif node.left.nil? || node.right.nil? # one child; either left or right
      delete_single_child(value, parent, node)
    else # two children ; both left and right
      delete_double_child(value, parent, node)
    end
  end

  def find(value, node = root)
    return node if value == node.data

    if value > node.data
      node.right.nil? ? node.left : find(value, node.right)
    else
      node.left.nil? ? node.left : find(value, node.left)
    end
  end

  def parent_node(value, node = root)
    return nil if root.data == value
    return node if node.left.data == value || node.right.data == value

    node.data > value ? parent_node(value, node.left) : parent_node(value, node.right)
  end

  # TODO
  def level_order(node = root)
    # Part 1
    # Move through each node in at a particular level
    # Maintain a queue: store discovered node and its children into a queue
    # Obtain an ordered queue
    # Part 2
    # Return the data of all the nodes in the queue
  end

  def inorder(node = root)
    return if node.nil?

    inorder(node.left)
    puts node.data
    inorder(node.right)
  end

  def preorder(node = root)
    return if node.nil?

    puts node.data
    inorder(node.left)
    inorder(node.right)
  end

  def postorder(node = root)
    return if node.nil?

    inorder(node.left)
    inorder(node.right)
    puts node.data
  end

  # TODO
  def height(node = root); end

  def depth(value, node = root)
    return 0 if node.data == value # root node is 0 edges

    levels = 1 # Including root edge
    until node.nil?
      node = node.left if node.data > value
      node = node.right if node.data < value
      levels += 1
      return levels if node.data == value
    end
  end

  # TODO
  def balanced?(node = root); end

  # TODO
  def rebalance; end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  private

  def delete_leaf(value, parent)
    parent.left.data == value ? parent.left = nil : parent.right = nil
  end

  def delete_single_child(value, parent, node)
    case parent.left.data == value
    when true # Is Left
      parent.left = (node.left.nil? ? node.right : node.left)
    when false # Is Right
      parent.right = (node.left.nil? ? node.right : node.left)
    end
  end

  def delete_double_child(_value, parent, node)
    leafmost = leafmost_left(node.right)

    delete(leafmost.data) # Prevent backlinks

    case parent.left == node
    when true
      leafmost.left = node.left
      leafmost.right = node.right
      parent.left = leafmost
    when false
      leafmost.left = node.left
      leafmost.right = node.right
      parent.right = leafmost
    end
  end

  def swap_nodes(one, two, parent, direction)
    two.left = one.left
    two.right = one.right
    parent.right = two if direction == 'right'
    parent.left =  two if direction == 'left'
  end

  def leafmost_left(node)
    return node if node.left.nil?

    node = node.left
    leafmost_left(node)
  end
end
