# Chapter 2 - Single Responsibility
Look for nouns that represent objects in the domain of your problem.  For
calculating gear ratios, the candidates are ``bicycle`` and ``gear``.  But
don't just automatically assume you need a ``bicycle`` class.  When talking
about gear ratios, we talk about *chainrings* and *cogs*, both of which are
part of the *Gear*, which should be a class (a *Gear* is basically the
combination of a chainring and a cog, and therefore it makes sense for those
things to be part of it, and to talk about a gear's chainring to cog ratio.

## Determining Single Responsibility
1. Pretend it's a person and ask it questions -- they should make sense.

"Mr. Gear, what is your ``ratio``?" - OK
"Mr. Gear, what are your ``gear_inches``?" - Not sure
"Mr. Gear, what is your ``tire`` (size)?" - Bad
**Anything that Gear can respond to is just another message.**  Tire is no
different from ``ratio`` or ``gear_inches``; from the POV of other objects,
anything Gear can respond to is just a message.  Someone will eventually send
this message, so it needs to be reasonable for Gear to be responding to it.

2. Sum up what the class does in a single sentence -- it should be simple.

You shouldn't need to use the words *and* or *or*, since the class should
only do one simple thing (the smallest possible thing that's useful).

3. Ask what the *responsibility* of the class is, and then see if it's doing
things unrelated to that responsibility

## How to Embrace Change
1. Depend on "Behavior" instead of data
2. Hide instance variables

Use ``attr_reader``, ``attr_writer`` and ``attr_accessor``, since they replace
instance variables with the result of a message send, so that the *data*
becomes *behavior* that is only defined once.  Send messages to access variables
even if you think of them as data.

3. Hide data structures

In *26_obscuring_references.rb*, the ``diameters`` method sends the ``data``
message to get the variable's contents.  But since ``@data`` is complicated,
you need to do more than hide it.  ``data`` just returns an array, so every
sender of the ``data`` message needs to have knowledge about the specific
makeup of the data (whether it's stored as an array or a hash, which index
contains what, etc.)

In *28_revealing_references.rb*, the ``wheelify`` method is the single point
for turning ``data`` into a ``wheel``, so everyone else can just send the
expressive ``rim`` and ``tire`` messages instead of having to mess with
indexing the array, etc.  It *trades indexing into a structure for sending 
messages to an object*.

## Single Responsibility for methods
You can also ask methods questions about what they do and describe what they're
doing in a single sentence.
* Making it so each method in a class has only a single responsibility makes
it obvious when something doesn't belong and more clear what everything is doing
* Encourages reuse
* Easy to move
* Makes the code more self-documenting

**Postpone design decisions until you are FORCED to make them**.
**You can define methods as blocks in ``Struct`` definitions**
```Ruby
Wheel = Struct.new(:rim, :tire) do
  def diameter
    rim + (tire * 2)
  end
end
```

You can use this when you want to make an object but it will only be used
inside a differnt class, and it's not worth making its own class.

# Chapter 3 - Dependencies
For some desired behavior to exist in a system, there must be an object that
contains it.  So an object either knows a behavior personally, inherits the
behavior, or knows some other object that knows it personally.  This chapter
is about getting behavior from *other objects*.  *Knowing something* about
another object creates a dependency.  We want to create as few of these
as possible.  A dependency can also be defined as the need for an object to
change as the result of a change in a different object.

Rules:
* A class should never know the name of a message you plan to send to someone
other than ``self``
* You shouldn't refer to another class by its name.
* Inject dependencies through arguments in ``initialize``, instead of creating
instances of specific external classes in methods.
* Don't have a method in class A that knows what message class B responds to
* Reverse dependencies so that A depends on B when B is less likely to change
than A.

## Dependency Injection
Our Gear method contains a direct reference to the ``Wheel`` class.  So if the
``Wheel`` class's name changes, Gear will have to change too.  This is actually
easy to fix, but there are other problems.  

**Having a reference to the ``Wheel`` class means Gear is only willing to
calculate gear inches for instances of ``Wheel``**.  If you later add some other
class that also has the concept of a ``diameter``, Gear won't be able to send
that message, because it's coupled to ``Wheel``.

What's necessary in order to calculate ``gear_inches``?
* An object that responds to ``diameter``

That's really it.  It doesn't need to be a wheel.  It just has to give a result
when sent the ``diameter`` message; ``Gear`` already has everything else it
needs.

You also need to isolate external *messages* (ones that are sent to someone
other than ``self``).






















































