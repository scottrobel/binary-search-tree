# frozen_string_literal: true

# Traverse Class contains method to Traverse the Tree
module Traverse
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

  def find_min_of_multibranch_node(node)
    min_right = find_min(node.right_link)
    min_left = find_min(node.left_link)
    min_right.data < min_left.data ? min_right : min_left
  end

  def iterate_array(array, args)
    array.each do |data_value|
      args[0].call(data_value) if args[0].class == Proc
      yield(data_value) if block_given?
    end
  end

  def get_level_order_array(node)
    level_order_array = []
    data_queue = Queue.new
    data_queue << node
    until data_queue.empty?
      temp = data_queue.pop
      level_order_array << temp.data
      data_queue << temp.left_link unless temp.left_link.nil?
      data_queue << temp.right_link unless temp.right_link.nil?
    end
    level_order_array
  end

  def select_treversal_step(node, step_array, array, step)
    case step
    when 'node'
      array << node.data
    when 'right'
      array += traverse(node.right_link, step_array) unless node.right_link.nil?
    when 'left'
      array += traverse(node.left_link, step_array) unless node.left_link.nil?
    end
    array
  end

  def traverse(node, steps_array)
    return [node.data] if node.left_link.nil? && node.right_link.nil?

    array = []
    3.times do |iteration|
      step = steps_array[iteration]
      array = select_treversal_step(node, steps_array, array, step)
    end
    array
  end

  def get_postorder_array(node)
    traverse(node, %w[left right node])
  end

  def get_inorder_array(node)
    traverse(node, %w[left node right])
  end

  def get_preorder_array(node)
    traverse(node, %w[node left right])
  end

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
end
