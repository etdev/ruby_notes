# If you can't get rid of the ``Wheel.new`` call, you should
# at least isolate it in ``Gear``'s initialize method to expose
# the dependency
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

# Or you could do this:
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end
end
# it still shouldn't take rim and tire as arguments, and it still
# shouldn't be stuck to Wheel, but these are still improvements.
