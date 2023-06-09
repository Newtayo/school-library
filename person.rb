require './nameable'
require './capitalizedecorator'
require './trimmerdecorator'
class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    if @age >= 18 || @parent_permission
      true
    else
      false
    end
  end

  private

  def of_age?
    @age >= 18
  end

  def add_rental()
    rental = Rental.new(date, book, self)
    @rentals << rental
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
