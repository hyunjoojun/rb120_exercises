class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end

  def to_s
    "a #{type} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end

  def print_pets
    puts pets
  end
end

class Shelter
  attr_reader :unadopted_pets

  def initialize
    @owners = {}
    @unadopted_pets = []
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners[owner.name] ||= owner
  end

  def accept_pet(pet)
    @unadopted_pets << pet
  end

  def print_adoptions
    @owners.each_pair do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end

  def number_of_unadopted_pets
    @unadopted_pets.size
  end

  def print_available
    puts "The animal shelter has #{number_of_unadopted_pets} unadopted pets."
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.accept_pet(Pet.new('dog', 'Jetty'))
shelter.accept_pet(Pet.new('dog', 'Cloudy'))
shelter.accept_pet(Pet.new('cat', 'Fluffy'))
shelter.accept_pet(Pet.new('cat', 'Kat'))
shelter.accept_pet(Pet.new('cat', 'Ben'))
shelter.accept_pet(Pet.new('parakeet', 'Chatterbox'))
shelter.accept_pet(Pet.new('parakeet', 'Bluebell'))

shelter.print_adoptions
shelter.print_available

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

puts ' '
puts 'Unadopted pets :'
puts shelter.unadopted_pets
