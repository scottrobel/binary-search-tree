# frozen_string_literal: true

load './lib/node.rb'
load './lib/balance.rb'
load './lib/traverse.rb'
load './lib/modify.rb'
load './lib/binary_search_tree.rb'
my_tree = Tree.new(Array.new(10) { rand(1..100) })
print "#{my_tree.balanced?}\n"
print "#{my_tree.level_order}\n"
print "#{my_tree.preorder}\n"
print "#{my_tree.postorder}\n"
print "#{my_tree.inorder}\n"
Array.new(5) { rand(100..150) }.each do |data|
  my_tree.insert(data)
end
print "#{my_tree.balanced?}\n"
my_tree.rebalance!
print "#{my_tree.balanced?}\n"
print "#{my_tree.level_order}\n"
print "#{my_tree.preorder}\n"
print "#{my_tree.postorder}\n"
print "#{my_tree.inorder}\n"

# 1. Create a binary search tree from an array of random numbers
# 2. Confirm that the tree is balanced by calling `#balanced?`
# 3. Print out all elements in level, pre, post, and in order
# 4. try to unbalance the tree by adding several numbers > 100
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
# 6. Balance the tree by calling `#rebalance!`
# 7. Confirm that the tree is balanced by calling `#balanced?`
# 8. Print out all elements in level, pre, post, and in order
