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

class Stack
    attr_reader :data
    
    def initialize
        @data = nil 
    end

    #The first push will consist of a (value, nil) node; bu pointing
    #to nil, it serves as the bottom of the stack. Hence the relevance of
    #initializing Stack with @data as nil.
    #Additional pushes will use the prior node as @next_node
    #i.e. successive pushes point to the element immediately below in
    #the stack.
    def push(value)
      @data = LinkedListNode.new(value, @data) 
    end
    
    #Popping first stores the @data.value in a variable, i.e. captures
    #the value of the item at the top of the stack. @data is then switched
    #for the next node (i.e. the item immediately below in the stack).
    #Returns the value of the earlier node that was captured in the variable.
    #The key is that we save the "top" value in the variable, so we can
    #return it after "popping" and setting @data to a new value.
    def pop
      popped_value = @data.value
      @data = @data.next_node
      popped_value
    end
    
end

def reverse_list(list)
  #create a new Stack object 
  stack = Stack.new 

  #push values into stack unless they're nil
  while list
    stack.push(list.value)
    list = list.next_node
  end
  
  #change return the stack values by popping and setting the next node to 
  #the previous value
  LinkedListNode.new(stack.pop, stack.data)
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