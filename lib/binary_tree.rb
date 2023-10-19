require_relative 'node'

# Binary Tree class
# build_tree(in_array) -> builds a balanced binary tree from given input and returns root node
# insert(value) -> inserts a new node with the given value
# delete(value) -> deletes node with the given value
# find(value) -> returns node with given value
# level_order(block) -> accepts block, returns array of values if no block given. Travels the tree with breadth-first algo and yields values.
# inorder(block) -> accepts block, returns array of values if no block given. Travels the tree with inorder algo and yields values.
# postorder(block) -> accepts block, returns array of values if no block given. Travels the tree with postorder algo and yields values.
# height(node) -> returns height of given node
# depth(node) -> returns depth of given node
# balanced? -> returns true if tree is balanced, false otherwise
# rebalance -> rebalances an unbalanced tree
# pretty_print -> prints tree in a pretty way


class BinaryTree
  def initialize(in_array)
    @root = build_tree(in_array)
  end

  def build_tree(in_array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end