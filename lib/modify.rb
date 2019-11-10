# frozen_string_literal: true

require 'pry'
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

  %w[right left].each do |branch|
    define_method("insert_#{branch}_node") do |data, node|
      branch_method = node.method("#{branch}_link".to_sym)
      if branch_method.call.nil?
        node.method("#{branch}_link=".to_sym).call(Node.new(data))
      else
        insert(data, branch_method.call)
      end
    end
  end
end
