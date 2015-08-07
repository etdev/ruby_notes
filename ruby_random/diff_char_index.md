# The Problem
Find the index of the first differing character between two strings, ``str_a`` and ``str_b``

# Initial attempt (working but non-ideal)
```ruby
def diff_char_index(str_a, str_b)
  arr_a, arr_b = str_a.split(""), str_b.split("")
  return -1 unless valid_string?(str_a) && valid_string?(str_b)
  arr_a.each_index do |i|
    return i unless arr_a[i] == arr_b[i]
  end
end

def valid_string?(str)
  return false unless str.is_a?(String)
  return false unless str.size > 0
  true
end

str_a = "a"
str_b = "b"

puts diff_char_index(str_a, str_b)
```

# Final solution A (from StackOverflow)
```ruby
def diff_char_index(str_a, str_b)
  str_a.each_char.with_index
    .find_index { |char, idx| char != str_b[idx] } || str_a.size
end
```

# Final solution B (from StackOverflow)
```ruby
def diff_char_index(str_a, str_b)
  (0...str_a.size).find { |i| str_a[i] != str_b[i] } || str_a.size
end
```

# Lessons learned
* Use ``str.each_char`` to access each character in a string without having to make a copy of it
* You can tack ``with_index`` on to any ``Enumerator`` like the result of ``map``, ``each``, etc.
* ``Enumerable#find_index`` returns the index of the first object for which the provided block is true.  Returns ``nil`` if no match is found.
* Use ``0...str_a.size``, not ``0..str_a.size-1``
