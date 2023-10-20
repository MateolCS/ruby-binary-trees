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
    return nil if in_array.empty?

    sorted = in_array.sort.uniq
    mid = sorted.length / 2

    root = Node.new(sorted[mid])
    root.left = build_tree(sorted[0...mid])
    root.right = build_tree(sorted[mid + 1..-1])
    root
  end

  def find(value, node = @root)
    return nil if node.nil?
    return node if node.value == value

    value < node.value ? find(value, node.left) : find(value, node.right)
  end

  def insert(value, node = @root)
    if node.nil?
      return Node.new(value)
    elsif node.value > value
      node.left = Node.new(value) if node.left.nil?
      insert(value, node.left)
    elsif node.value < value
      node.right = Node.new(value) if node.right.nil?
      insert(value, node.right)
    end

  end

  def delete(value, node = @root)
    until node.value == value
      parent = node
      node = value < node.value ? node.left : node.right
    end

    if node.left.nil? && node.right.nil?
      parent.left = nil if parent.left == node
      parent.right = nil if parent.right == node
    elsif node.left.nil?
      parent.right = node.right if partent.right == node
    elsif node.right.nil?
      parent.left = node.left if parent.left == node
    else
      parent.left = node.left
      parent.right = node.right
    end
    node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end