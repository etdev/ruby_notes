# There are many different ways to define defaults for
# hash arguments
def initialize(args)
  @chainring = args[:chainring] || 40
  @cog = args[:cog] || 18
  @wheel = args[:wheel]
end
# gives unexpected results for boolean values -> AVOID

def initialize(args)
  @chainring = args.fetch(:chainring, 40)
  @cog = args.fetch(:cog, 18)
  @wheel = args[:wheel]
end
# Better; Sets @chainring to 40 only if args doesn't contain the key :chainring.

def initialize(args)
  args = defaults.merge(args)
  @chainring = args[:chainring]
  # ...
end

def defaults
  {
    chainring: 40,
    cog: 18
  }
end
# Also good, especially when the defaults are complicated.

def initialize(chainring: 40, cog: 18, wheel:)
  @chainring = chainring
  @cog = cog
  @wheel = wheel
end
# Not mentioned in POODR, but also good (perhaps best).
