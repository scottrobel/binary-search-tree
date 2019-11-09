# frozen_string_literal: true

# Balance contains methods that help balance the tree
module Balance
  def find_min(node)
    if node.right_link.nil? && node.left_link.nil?
      node
    elsif node.left_link.nil?
      find_min(node.right_link)
    elsif node.right_link.nil?
      find_min(node.left_link)
    else
      find_min_of_multibranch_node(node)
    end
  end

  def get_node_branch_arrays(array)
    center_value = array[array.size / 2]
    smaller_values = array[0..array.size / 2] - [center_value]
    greater_values = array[array.size / 2..array.length - 1] - [center_value]
    [smaller_values, center_value, greater_values]
  end

  def get_level_order_array(node)
    level_order_array = []
    data_queue = Queue.new
    data_queue << node
    until data_queue.empty?
      temp = data_queue.pop
      level_order_array << temp.data
      data_queue << temp.right_link unless temp.right_link.nil?
      data_queue << temp.left_link unless temp.left_link.nil?
    end
    level_order_array
  end

  private

  def find_min_of_multibranch_node(node)
    min_right = find_min(node.right_link)
    min_left = find_min(node.left_link)
    min_right.data < min_left.data ? min_right : min_left
  end
end
