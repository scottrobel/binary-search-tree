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

  %w[pre in post level].each do |order|
    define_method("#{order}order") do |*args|
      array = method("get_#{order}order_array".to_sym).call(root_node)
      iterate_array(array, args) { |a| yield(a) if block_given? }
    end
  end
end
