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

def get_node_branch_arrays(array)
  center_value = array[array.size / 2]
  smaller_values = array[0..array.size / 2] - [center_value]
  greater_values = array[array.size / 2..array.length - 1] - [center_value]
  [smaller_values, center_value, greater_values]
end

my_tree = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
pry.binding