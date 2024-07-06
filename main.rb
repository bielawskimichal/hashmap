require_relative 'lib/hashmap'

test = HashMap.new
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('kite', 'replaced')
test.set('lion', 'golden')

# test.remove_at('apple')

p "keys: #{test.keys}"
p "values: #{test.values}"
p "entries: #{test.entries}"
p "has apple?: #{test.has?('apple')}"
p "has second key?: #{test.has?('second key')}"
p "get ice cream: #{test.get('ice cream')}"
test.remove_at('sec key')
p "length: #{test.length}"
p "buckets length #{test.buckets.length}"

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

p "keys: #{test.keys}"

test.set('moon', 'silver')

p "keys: #{test.keys}"
p "values: #{test.values}"
p "entries: #{test.entries}"
p "has apple?: #{test.has?('apple')}"
p "has second key?: #{test.has?('second key')}"
p "get ice cream: #{test.get('ice cream')}"
test.remove_at('sec key')
p "length: #{test.length}"
p "buckets length #{test.buckets.length}"

hashset_test = HashSet.new
hashset_test.set('apple')
hashset_test.set('banana')
hashset_test.set('carrot')
hashset_test.set('dog')
hashset_test.set('elephant')
hashset_test.set('frog')
hashset_test.set('grape')
hashset_test.set('hat')
hashset_test.set('ice cream')
hashset_test.set('jacket')
hashset_test.set('kite')
hashset_test.set('kite')
hashset_test.set('lion')

hashset_test.remove_at('apple')
p hashset_test.has?('apple')
hashset_test.set('apple')
p hashset_test.has?('apple')

p "keys: #{hashset_test.keys}"
p "entries: #{hashset_test.entries}"
p "has apple?: #{hashset_test.has?('apple')}"
p "has second key?: #{hashset_test.has?('second key')}"
p "get ice cream: #{hashset_test.get('ice cream')}"
hashset_test.remove_at('sec key')
p "length: #{hashset_test.length}"
p "buckets length #{hashset_test.buckets.length}"

hashset_test.set('apple')
hashset_test.set('banana')
hashset_test.set('carrot')
hashset_test.set('dog')
hashset_test.set('elephant')
hashset_test.set('frog')
hashset_test.set('grape')
hashset_test.set('hat')
hashset_test.set('ice cream')
hashset_test.set('jacket')
hashset_test.set('kite')
hashset_test.set('lion')

p "keys: #{hashset_test.keys}"

hashset_test.set('moon')

p "keys: #{hashset_test.keys}"
p "entries: #{hashset_test.entries}"
p "has apple?: #{hashset_test.has?('apple')}"
p "has second key?: #{hashset_test.has?('second key')}"
p "get ice cream: #{hashset_test.get('ice cream')}"
hashset_test.remove_at('sec key')
p "length: #{hashset_test.length}"
p "buckets length #{hashset_test.buckets.length}"
