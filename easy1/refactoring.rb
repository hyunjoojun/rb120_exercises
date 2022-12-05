class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class::NUMBER_OF_WHEELS
  end
end

class Car < Vehicle
  NUMBER_OF_WHEELS = 4
end

class Motorcycle < Vehicle
  NUMBER_OF_WHEELS = 2
end

class Truck < Vehicle
  NUMBER_OF_WHEELS = 6
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end
