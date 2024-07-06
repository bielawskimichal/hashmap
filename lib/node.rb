class Node
  attr_accessor :value, :key, :next_node

  def initialize(key, value, next_node = nil)
    @key = key
    @value = value
    @next_node = next_node
  end

  def to_s
    "{ #{@key} => #{@value} }"
  end
end
