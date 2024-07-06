class Node
  attr_accessor :value, :key, :next_node

  def initialize(key, value = nil, next_node = nil)
    @key = key
    @value = value unless value.nil?
    @next_node = next_node
  end

  def to_s
    return @key.to_s if value.nil?

    "{ #{@key} => #{@value} }"
  end
end
