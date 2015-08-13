# What do you do when you don't have control over the
# initialize method for Gear?

module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog = cog
      @wheel = wheel
    end
    # ...
  end
end

# wrap the interface to protect yourself from changes
module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(args[:chainring],
                            args[:cog],
                            args[:wheel])
  end
end

# now you can create a new Gear with an arguments hash:
GearWrapper.gear(
  chainring: 52,
  cog: 11,
  wheel: Wheel.new(26, 1.5)
).gear_inches

# Using Module instead of Class for GearWrapper conveys that
# we don't plan on instantiating instances of GearWrapper.
# GearWrapper is a FACTORY, or thing whose sole purpose is
# to create instances of some other class.
