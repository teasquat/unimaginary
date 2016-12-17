require "src/util/math"

print_tbl = (a) ->
  print "{"
  for k, v in pairs a
    print "  #{v}"
  print "}"

a = Vector {1, 2, 3, 4}
b = Vector {1, 1, 1, 1}

print_tbl a.content
print_tbl b.content

c = a + b

print_tbl c.content

c = Vector {1, 1}
m = Matrix 2, 2, 3

print_tbl m.content.content

d = m * c

print_tbl d.content
