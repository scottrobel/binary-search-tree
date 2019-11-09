# frozen_string_literal: true

require 'pry'
load 'node.rb'
load 'balance.rb'
# Tree class creates a balanced node tree
# from an array when initialized
# Does not handle duplicate values
class Tree
  include Balance
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

  def level_order(*args)
    level_order_array = get_level_order_array(root_node)
    level_order_array.each do |data_value|
      args[0].call(data_value) if args[0].class == Proc
      yield(data_value) if block_given?
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
my_tree = Tree.new([1])
my_tree.preorder
