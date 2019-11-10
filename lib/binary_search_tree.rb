# frozen_string_literal: true

# Tree class creates a balanced node tree
# from an array when initialized
# Does not handle duplicate values
class Tree
  include Balance
  include Traverse
  include Modify
  attr_reader :root_node
  def initialize(array)
    @root_node = build_tree(array)
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
end
