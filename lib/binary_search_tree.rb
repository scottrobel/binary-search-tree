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

  private

  def search_branches_for_node(data, node)
    right_search = find(data, node.right_link)
    left_search = find(data, node.left_link)
    if !right_search.nil?
      right_search
    elsif !left_search.nil?
      left_search
    else
      return nil
    end
  end

  def delete_node(node)
    if node.left_link.nil? && node.right_link.nil?
      nil
    elsif node.left_link.nil? || node.right_link.nil?
      delete_single_branch_node(node)
    else
      delete_multibranch_node(node)
    end
  end

  def delete_single_branch_node(node)
    if node.left_link.nil?
      node.right_link
    else
      node.left_link
    end
  end

  def delete_multibranch_node(node)
    temp = find_min(node.right_link)
    node.data = temp.data
    delete(temp.data, node.right_link)
    node
  end

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
end

my_tree = Tree.new([5, 2, 3, 4, 1, 6, 7, 8])
my_tree.delete(5)
my_tree.find(1)
