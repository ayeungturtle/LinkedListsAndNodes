class List
    attr_accessor :start
    def initialize(start_node)
        @start = start_node
    end

    def append(node)
      cur_node = @start
      while cur_node.next != nil
        cur_node = cur_node.next
      end 
      cur_node.next = node
    end

    def insert(node, position)
        count = 0
        cur_node = @start 
        while count < position-1
            cur_node = cur_node.next
            count += 1
        end
        temp_node = cur_node.next
        cur_node.next = node
        node.next = temp_node
    end

    def delete(position)
        count = 0
        cur_node = @start 
        while count < position-1
            cur_node = cur_node.next
            count += 1
        end
        temp_node = cur_node
        cur_node= cur_node.next
        temp_node.next = cur_node.next
    end

    def print_list()
        cur_node = @start 
        puts cur_node.value
        while cur_node.next != nil
            cur_node = cur_node.next
            puts cur_node.value
        end     
    end

    def length()
        cur_node = @start   
        count = 1
        while cur_node.next != nil do
          cur_node = cur_node.next
          count += 1
        end 
        return count
    end

    def give_val_find_ind(value)
        cur_node = @start 
        count = 0
        while true
            if cur_node.value == value
                return count
            elsif cur_node.next == nil
                return -1 #if it goes through the whole list and still doesn't find it
            end
            cur_node = cur_node.next
            count += 1
        end
    end

    def give_ind_find_val(index)
        count = 0
        cur_node = @start 
        while count < index
            cur_node = cur_node.next
            count += 1
        end
        return cur_node.value
    end
end

class Node
    attr_accessor :value 
    attr_accessor :next
    def initialize(value)
        @value = value
    end
end


test_node = Node.new(3)
test_node1 = Node.new(14)
test_node2 = Node.new(33)
test_node3 = Node.new(8)
test_node4 = Node.new(10)
test1 = List.new(test_node)
test1.append(test_node1)
test1.append(test_node2)
test1.append(test_node3)
test1.insert(test_node4, 3)
test1.delete(2)
test1.print_list
puts "The index of value 33 is #{test1.give_val_find_ind(33)}"
puts "The index of value 8 is #{test1.give_val_find_ind(8)}"
puts "The value at index 2 is #{test1.give_ind_find_val(2)}"
puts "This is the length of the list: #{test1.length}"