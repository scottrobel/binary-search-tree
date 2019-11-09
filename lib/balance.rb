# frozen_string_literal: true

# Balance contains methods that help balance the tree
module Balance
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

  def rebalance!
    @root_node = build_tree(get_level_order_array(root_node))
  end

  def balanced?
    rebuilt_tree =
      get_level_order_array(build_tree(get_level_order_array(root_node)))
    get_level_order_array(@root_node) == rebuilt_tree
  end

  private

  def get_node_branch_arrays(array)
    center_value = array[array.size / 2]
    smaller_values = array[0..array.size / 2] - [center_value]
    greater_values = array[array.size / 2..array.length - 1] - [center_value]
    [smaller_values, center_value, greater_values]
  end
end
