# frozen_string_literal: true

require 'pry'
load 'node.rb'
load 'balance.rb'
load 'traverse.rb'
# Tree class creates a balanced node tree
# from an array when initialized
# Does not handle duplicate values
class Tree
  include Balance
  include Traverse
  attr_reader :root_node
  def initialize(array)
    @root_node = build_tree(array)
  end

  def build_tree(array)
    array.uniq!
    array.sort!
    return Node.new(array[0]) if array.size == 1
    return nil if array.empty?

    smaller_values, center_value, greater_values = get_node_branch_arrays(array)
    node = Node.new(center_value)
    node.right_link = build_tree(greater_values)
    node.left_link = build_tree(smaller_values)
    node
  end

  def depth(node = root_node)
    return 1 if node.right_link.nil? && node.left_link.nil?
    depth = 1
    right_depth = node.right_link.nil? ? 0 : depth(node.right_link)
    left_depth = node.left_link.nil? ? 0 : depth(node.left_link)
    depth = right_depth < left_depth ? left_depth : right_depth
    depth + 1
  end

  def preorder(*args)
    array = get_preorder_array(root_node)
    iterate_array(array, args) { |a| yield(a) if block_given? }
  end

  def inorder(*args)
    array = get_inorder_array(root_node)
    iterate_array(array, args) { |a| yield(a) if block_given? }
  end

  def postorder(*args)
    array = get_postorder_array(root_node)
    iterate_array(array, args) { |a| yield(a) if block_given? }
  end

  def level_order(*args)
    array = get_level_order_array(root_node)
    iterate_array(array, args) { |a| yield(a) if block_given? }
  end

  def insert(data, node = root_node)
    return if data == node.data # does not support duplicate values

    if data > node.data
      insert_right_node(data, node)
    else
      insert_left_node(data, node)
    end
  end

  def delete(data, node = root_node)
    return nil if node.nil?

    if data < node.data
      node.left_link = delete(data, node.left_link)
    elsif data > node.data
      node.right_link = delete(data, node.right_link)
    else
      delete_node(node)
    end
  end

  def find(data, node = root_node)
    return nil if node.nil?

    if data == node.data
      node
    else
      search_branches_for_node(data, node)
    end
  end
end
# my_tree.delete(5)
# my_tree.find(1)
# my_tree.level_order { |a| print a }
# my_proc = proc { |data| print data }
# my_lambda = ->(data) { print data }
# my_tree.level_order(&my_proc)
# my_tree.level_order(&my_lambda)
# my_tree.level_order { |a| print a }
# my_tree.level_order.inject{ |a, b| a + b }
my_tree = Tree.new([1, 2, 3, 4, 5, 6])
print my_tree.depth
