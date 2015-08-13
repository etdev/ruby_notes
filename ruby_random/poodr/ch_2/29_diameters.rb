# diameters method of RevealingReferences:
def diameters
  wheels.collect{ |wheel| wheel.rim + (wheel.tire * 2) }
end
# Mr. diameters, what do you do?
# - I iterate over wheels AND calculate the diameter of each wheel. --> BAD
# This method iterates over wheels AND calculates the diameter of each wheel.

# Separate into two methods:
def diameters
  wheels.map{ |wheel| diameter(wheel) }
end
# Mr. diameters, what do you do?
# - I get the ``diameter`` for each wheel in wheels

def diameter(wheel)
  wheel.rim + (wheel.tire * 2)
end
# Mr. diameter, what do you do?
# - I calculate the diameter of a wheel.

