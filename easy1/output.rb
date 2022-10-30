# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     @name.upcase!
#     "My name is #{@name}."
#   end
# end

class  Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# The local variable name and the instance variable @name refers to two different objects.
# First, the local variable name is initialized to the integer 42.
# Then fluffy is created as a pet object with name 42.
# Line 18 name.to_s method will swith the integer 42 to the string '42'.
# So fluffy's name becomes '42'.
# On line 28, we reassign the local variable name to 43 by adding 1.
# This results in outputting the integer 43 on line 32.
# The fluffy's name stays the same because we reassigned local variable only.
