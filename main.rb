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
test.set('lion', 'golden')

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
