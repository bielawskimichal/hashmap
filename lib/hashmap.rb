require 'pry-byebug'
require_relative 'linked_list'

class HashMap
  attr_accessor :buckets

  def initialize
    @default_size = 16
    @load_factor = 0.75
    @buckets = Array.new(@default_size) { [] }
  end

  def get_index(key, size = @buckets.length)
    hash = hash(key)
    index = hash % size
    raise IndexError if index.negative? || index >= size

    index
  end

  def hash(key)
    hash_code = 0
    key.each_char { |char| hash_code = 31 * hash_code + char.ord }
    hash_code
  end

  def set(key, value)
    index = get_index(key)

    @buckets[index].each do |node|
      next unless node.key == key

      return node.value = value
    end

    @buckets[index] = LinkedList.new if @buckets[index].empty?
    @buckets[index].append(key, value)

    check_load
  end

  def has?(key)
    index = get_index(key)
    return false if @buckets[index].empty?

    @buckets[index].contains_key?(key)
  end

  def remove_at(key)
    index = get_index(key)
    return nil if @buckets[index].empty?

    index = get_index(key)
    puts(@buckets[index].each(&:values))
    @buckets[index] = []
  end

  def clear
    @buckets = Array.new(@default_size) { [] }
  end

  def get(key)
    index = get_index(key)
    raise IndexError if @buckets[index].empty?

    @buckets[index].values
  end

  def keys
    array = []
    @buckets.reject(&:empty?).each do |list|
      list.each do |node|
        array << node.key
      end
    end
    array
  end

  def values
    array = []
    @buckets.reject(&:empty?).each do |list|
      list.each do |node|
        array << node.value
      end
    end
    array
  end

  def entries
    array = []
    @buckets.reject(&:empty?).each do |list|
      list.each do |node|
        array << [node.key, node.value]
      end
    end
    array
  end

  def length
    entries.length
  end

  def check_load
    count = length
    return unless count > @buckets.length * @load_factor

    size = @buckets.length * 2
    new_buckets = Array.new(size) { [] }

    @buckets.each do |list|
      list.each do |node|
        index = get_index(node.key, size)
        new_buckets[index] = LinkedList.new if new_buckets[index].empty?
        new_buckets[index].append(node.key, node.value)
      end
    end
    @buckets = new_buckets
  end
end
