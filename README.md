# binary-search-tree
In this project, I created an extremely easy interface to interact, Build, and balance binary search trees! ##first. add the lib folder to your ruby project Syntax: to add it in your project require these files.
##first. add the lib folder to your ruby project 
Syntax: 
to add it in your project require these files.
```
load './lib/node.rb'
load './lib/balance.rb'
load './lib/traverse.rb'
load './lib/modify.rb'
load './lib/binary_search_tree.rb'
```
To create a balanced search tree with an array of numbers simply
my_tree = Tree.new([YOUR ARRAY HERE])
To check if a search tree is a balanced use the "balanced?" method

##Transversal methods
these methods return a list of nodes
```
#Levelorder traversal
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
to insert data use 
```
my_tree.insert(data)
```
To rebalance the tree after adding nodes use
```
my_tree.rebalance!

```
