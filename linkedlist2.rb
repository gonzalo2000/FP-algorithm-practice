class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else      
    print "nil\n"
    return
  end
end


def reverse_list(list, previous=nil)
  new_node = LinkedListNode.new(list.value, previous)
  previous = list.next_node

  while previous != nil
    new_node = LinkedListNode(previous.value, previous)
    previous = list.next_node
  end
  new_node

end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "-------"

revlist = reverse_list(node3)
print_values(revlist)

# returns:
# 12 --> 99 --> 37 --> nil
# ------
# 37 --> 99 --> 12 --> nil