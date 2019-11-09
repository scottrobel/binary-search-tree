# frozen_string_literal: true

# Balance contains methods that help balance the tree
module Balance
  private

  def get_node_branch_arrays(array)
    center_value = array[array.size / 2]
    smaller_values = array[0..array.size / 2] - [center_value]
    greater_values = array[array.size / 2..array.length - 1] - [center_value]
    [smaller_values, center_value, greater_values]
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
