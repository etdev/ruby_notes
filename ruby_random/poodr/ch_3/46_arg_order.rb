# When you send a message that require arguments, you can't
# avoid knowing what those arguments are.  But you CAN avoid
# knowing what order those arguments are in.

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end
end

Gear.new(
  52,
  11,
  Wheel.new(26, 1.5)).gear_inches

# Use Hashes for initialization arguments
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end
end

Gear.new(
  chainring: 52,
  cog: 11,
  wheel: Wheel.new(26, 1.5)
).gear_inches
