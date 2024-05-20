# frozen-string-literal: true

# Linked list of nodes
class LinkedList
  attr_accessor :head_node

  def initialize
    self.head_node = nil
  end

  def append(value)
    return self.head_node = Node.new(value) if head_node.nil?

    last_node = head_node
    last_node = last_node.next_node until last_node.next_node.nil?
    last_node.next_node = Node.new(value)
  end

  def prepend(value)
    old_node = head_node
    self.head_node = Node.new(value, old_node)
  end

  def size
    return head_node if head_node.nil?

    i = 1
    current_node = head_node
    until current_node.next_node.nil?
      current_node = current_node.next_node
      i += 1
    end
    i
  end

  def head
    head_node.value
  end

  def tail
    return head_node if head_node.nil?

    current_node = head_node
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node.value
  end

  def at(index)
    i = 0
    current_node = head_node
    until i == index
      return nil if current_node.next_node.nil?

      current_node = current_node.next_node
      i += 1
    end
    current_node.value
  end

  def pop
    current_node = head_node
    current_node = current_node.next_node until current_node.next_node.next_node.nil?

    end
    current_node.next_node = nil
  end

  def contains?(value)
    current_node = head_node
    return true if current_node.value == value

    until current_node.next_node.nil?
      current_node = current_node.next_node
      return true if current_node.value == value
    end
    false
  end

  def find(value)
    current_node = head_node
    i = 0
    return i if current_node.value == value

    until current_node.next_node.nil?
      current_node = current_node.next_node
      i += 1
      return i if current_node.value == value
    end
    nil
  end

  def to_s
    return nil if head_node.nil?

    current_node = head_node
    string = "( #{current_node.value} )"
    until current_node.next_node.nil?
      string.concat(" -> ( #{current_node.next_node.value} )")
      current_node = current_node.next_node
    end
    string.concat(' -> nil')
  end
end

private

# Individual data nodes for linked list
class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    self.next_node = next_node
    self.value = value
  end
end

list = LinkedList.new
list.append(10)
list.append(15)
list.append(20)
list.append(45)
list.prepend(9)
p list.to_s
p list.size
p list.head
p list.tail
p list.at(2)
list.pop
p list.to_s
p list.contains?(10)
p list.contains?(45)
p list.find(10)
p list.find(45)
