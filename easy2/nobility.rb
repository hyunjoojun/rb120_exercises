module Walkable
  def walk(title='')
    "#{title} #{name} #{gait} forward".lstrip
  end
end

class Person
  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Noble < Person
  include Walkable
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def walk
    super(title)
  end

  def gait
    "struts"
  end
end

class Cat
  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name
  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

byron = Noble.new("Byron", "Lord")
puts byron.walk
# => "Lord Byron struts forward"

mike = Person.new("Mike")
puts mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
puts kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
puts flash.walk
# => "Flash runs forward"
