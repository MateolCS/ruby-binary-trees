require './lib/binary_tree.rb'

input_array = [1,2,3,4,5,6,8,9,10]
binary_tree = BinaryTree.new(input_array)
binary_tree.pretty_print
binary_tree.insert(7)
binary_tree.pretty_print
binary_tree.delete(8)
binary_tree.pretty_print
binary_tree.delete(7)
binary_tree.pretty_print
binary_tree.delete(5)
binary_tree.pretty_print