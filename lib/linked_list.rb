require_relative 'node'

class LinkedList
  attr_accessor :head

  def initialize
    @tail = Node.new(nil, nil)
    @head = Node.new(nil, @tail)
  end

  def to_s(start = @head)
    a = to_a
    puts "( #{a.join(' ) -> ( ')} )"
  end

  def to_a(start = @head.next_node, a = [])
    return a if size.zero?
    return a << start if start == last_node

    to_a(start.next_node, a << start)
  end

  def size(tmp = @head.next_node, iteration = 0)
    return iteration if tmp == @tail || tmp.nil?

    iteration += 1
    size(tmp.next_node, iteration)
  end

  def last_node(start = @head)
    if size == 0
      nil
    elsif start.next_node == @tail
      start
    else
      last_node(start.next_node)
    end
  end

  def first_node
    @head.next_node
  end

  def append(key, value = nil)
    tmp = size.zero? ? @head : last_node
    node = Node.new(key, value, @tail)
    tmp.next_node = node
  end

  def prepend(key, value)
    node = Node.new(key, value, @head.next_node)
    @head.next_node = node
  end

  # Trzeba dodać kilka przypadków.
  def insert_at(key, value, index)
    if size == 0
      node = Node.new(key, value, @tail)
      @head.next_node = node
    elsif index > size - 1
      node = Node.new(key, value, @tail)
      last_node.next_node = node
    elsif index == 0
      node = Node.new(key, value, first_node)
      @head.next_node = node
    else
      node = Node.new(key, value, at(index))
      at(index - 1).next_node = node
    end
  end

  def replace_at(key, value, node = @head)
    return nil if node.nil?

    return node.value = value if node.key == key

    replace_at(key, value, node.next_node)
  end

  def remove_at(index)
    raise 'List is empty.' if empty?
    raise 'No Node at given index.' if at(index).nil?

    node = at(index)
    at(index - 1).next_node = node.next_node unless index.zero?
    @head.next_node = node.next_node if index.zero?
    node.next_node = nil
  end

  def each(node = @head.next_node, &block)
    return if node == @tail

    raise 'No block given.' unless block_given?

    yield node
    each(node.next_node, &block)
  end

  def at(index, node = @head.next_node, i = 0)
    return node if index == i
    return nil if node.nil?

    at(index, node.next_node, i + 1)
  end

  def pop(node = @head)
    if size.zero?
      nil
    elsif node.next_node.next_node == @tail
      node.next_node.next_node = nil
      node.next_node = @tail
      self
    else
      pop(node.next_node)
    end
  end

  def empty?
    size.zero?
  end

  def empty!
    return if empty?

    pop
    empty!
  end

  def values
    array = []
    each do |node|
      array << node.value
    end
    array.flatten
  end

  def keys
    array = []
    each do |node|
      array << node.key
    end
    array.flatten
  end

  def contains_value?(value)
    each do |e|
      return true if e.value == value
    end
    false
  end

  def contains_key?(key)
    each do |e|
      return true if e.key == key
    end
    false
  end

  def find(value)
    i = 0
    each do |e|
      return i if e.value == value

      i += 1
    end
    "#{value} not found."
  end
end
