a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# output => a, b, c are pointing at the same object.id because integers are immutable.