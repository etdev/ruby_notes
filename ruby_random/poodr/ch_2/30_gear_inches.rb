# gear_inches method from Gear class
def gear_inches
  # tire goes around rim twice for diameter
  ratio * (rim + (tire * 2))
end

# bad because it contains the calculation for ``diameter``

def gear_inches
  ratio * diameter
end
# What is this method doing?
# - Calculating the gear_inches for a gear object -- Sure.

def diameter
  rim + (tire * 2)
end
# What is this method doing?
# - Calculating the diameter of a wheel -- WHY IS THAT IN THE GAER CLASS?

