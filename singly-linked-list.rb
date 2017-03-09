# a singly-linked list does not have a loop if you traverse the entire list and the last node has a next pointer value equal to nil
# if any of the nodes have a next pointer value equal to the value of a node that has already been visited then there is a loop

# traverse the list and make the node's next pointer the key in a hash and the value 1 (representing that the node has been visited once). 
#After the entire list has been traversed, check to see if there are any nil values
	# If there is a nil value at the end then return false
	# If there is a value that is greater than 1 then return true

class LinkedListNode

  attr_accessor :node_value, :next_pointer

  def initialize(node_value, next_pointer)
    @node_value = node_value
    @next_pointer  = next_pointer
  end
end

def contains_cycle?(list)
	visited_nodes = {}
	list.each do |node|
		return false if node.next_pointer == nil 
		visited_nodes[node.next_pointer] ? visited_nodes[node.next_pointer] += 1 : visited_nodes[node.next_pointer] = 1
	end
	visited_nodes.values.any? {|num| num > 1}
end

no_loop_list = [LinkedListNode.new("dog", 1), LinkedListNode.new("cat", 2), LinkedListNode.new("cow", nil)]
loop_list = [LinkedListNode.new("dog", 1), LinkedListNode.new("cat", 2), LinkedListNode.new("cow", 1)]

contains_cycle?(no_loop_list)
contains_cycle?(loop_list)