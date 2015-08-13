# Hide instance variables
# DON'T do the following:
class Gear
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    @chainring / @cog.to_f # < -- road to ruin
  end
end
