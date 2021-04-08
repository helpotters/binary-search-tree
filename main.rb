#!/usr/bin/env ruby

require_relative('./lib/trees')

array = [1, 2, 3, 5, 234, 125, 1818, 182, 13, 2345, 19, 273, 65, 70, 10, 113, 99]

tree = Tree.new(array)
tree.pretty_print

# Construction
tree.insert(40)
tree.pretty_print
tree.insert(100)
tree.insert(65)
tree.insert(6500)
tree.insert(40)
tree.pretty_print

# Removal and location
p tree.find(99)
p tree.find(40)
p tree.find_up_one(40)
tree.delete(40)
tree.pretty_print

# Depth
tree.depth(40)
tree.depth(70)

# Order
tree.inorder
tree.preorder
tree.postorder

# Deletion
tree.delete(65)
tree.delete(40)
tree.delete(19)
tree.delete(1)
tree.delete(3)
tree.delete(99)
tree.delete(100)
tree.delete(1818)
tree.pretty_print

# Height and Depth
tree.depth(65)

tree.level_order
tree.height
