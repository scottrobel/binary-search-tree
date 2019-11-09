# frozen_string_literal: true

# Balance contains methods that help balance the tree
module Balance
  private

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

  def find_min_of_multibranch_node(node)
    min_right = find_min(node.right_link)
    min_left = find_min(node.left_link)
    min_right.data < min_left.data ? min_right : min_left
  end

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
