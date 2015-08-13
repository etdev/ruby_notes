def gear_inches
  ratio * wheel.diameter
end

# messages sent:
# ratio --> self
# diameter --> wheel

# wheel is an external (i.e. not 'self') object

def gear_inches
  # ... a few lines of scary math
  foo = some_intermediate_result * wheel.diameter
  # ... more lines of scary math
end

# relies on Gear responding to ``wheel`` and on ``wheel`` responding to ``diameter``.  A random line deep in ``gear_inches``
# shouldn't have this dependency.

# You can pull out ``diameter`` into a method though:
def gear_inches
  #... a few lines of scary math
  foo = some_intermediate_result * diameter
  #... more lines of scary math
end

def diameter
  wheel.diameter
end

# Now gear_inches doesn't know that wheel has a ``diameter``.
# And now gear_inches only depends on messages sent to ``self``.
