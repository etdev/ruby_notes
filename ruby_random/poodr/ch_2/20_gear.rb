# gear inches = wheel diameter * gear ratio
  # wheel diameter = rim diameter + 2*(tire diameter)

class Gear

  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    # ture goes around rim twice for diam.
    ratio * (rim + (tire * 2))
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(52, 11, 24, 1.25).gear_inches

# problems:
  # rim and tire aren't direct attributes of a gear, so they do't belong in the Gear class.
  # Gear.new(52, 11, 126, 1.5) is confusing and it's easy to forget which argument is which
  # You've now broken the 2-argument version:
  # Gear.new(52, 11).ratio
  # that worked before.
