# frozen_string_literal: true

# A node stores a value
# and can be assigned 2 links to other nodes.
class Node
  attr_accessor :right_link, :left_link, :data
  def initialize(data)
    self.data = data
  end
end
