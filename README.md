# binary-search-tree
In this project I created an extreamly easy interface to interct, Build and balance binary search trees!
Syntax: 
to add it in your project require these files.
```
load './lib/node.rb'
load './lib/balance.rb'
load './lib/traverse.rb'
load './lib/modify.rb'
load './lib/binary_search_tree.rb'
```
To create a balanced search tree with an array of numbers simpily
my_tree = Tree.new([YOUR ARRAY HERE])
To check if a search tree is balanced use the "balanced?" method

##Transversal methods
these methods return a list of tavered nodes in each order
Levelorder traversal
```
my_tree.levelorder
```
##Preorder
```
my_tree.preorder
```
##Postorder
```
my_tree.postorder
```
##Inorder
```
my_tree.inorder
```
