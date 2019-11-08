# frozen_string_literal: true

require 'pry'
# A node stores a value
# and can be assigned 2 links to other nodes.
class Node
  attr_accessor :right_link, :left_link, :data
  def initialize(data)
    self.data = data
  end
end
# Tree class creates a balanced node tree
# from an array when initialized
# Does not handle duplicate values
class Tree
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
    if data > node.data
      insert_right_node(data, node)
    elsif data < node.data
      insert_left_node(data, node)
    end
  end

  private

  def insert_right_node(data, node)
    if node.right_link.nil?
      node.right_link = Node.new(data)
    else
      insert(data, node.right_link)
    end
  end

  def insert_left_node(data, node)
    if node.left_link.nil?
      node.left_link = Node.new(data)
    else
      insert(data, node.left_link)
    end
  end

  def get_node_branch_arrays(array)
    center_value = array[array.size / 2]
    smaller_values = array[0..array.size / 2] - [center_value]
    greater_values = array[array.size / 2..array.length - 1] - [center_value]
    [smaller_values, center_value, greater_values]
  end
end
my_tree = Tree.new([1, 2, 3])
my_tree.insert(4)
root = my_tree.root_node
pry.binding
