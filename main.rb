#!/usr/bin/env ruby

require_relative('./lib/trees')

array = [1, 2, 3, 4, 5]

tree = Tree.new(array)
tree.pretty_print
