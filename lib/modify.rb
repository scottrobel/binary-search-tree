# frozen_string_literal: true

# Modify contains methods that modify the tree
module Modify
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

  private

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
