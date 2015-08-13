class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end
  # ...
end

Gear.new(52, 11, 26, 1.5).gear_inches
# Gear dependencies on Wheel
# 1) The name of the Wheel class.
# 2) The fact that wheels respond to the ``diameter`` message
# 3) The arguments that the ``diameter`` message expects
# 4) The order of these arguments
