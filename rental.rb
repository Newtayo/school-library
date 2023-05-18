require './person'
require './book'
require 'date'
class Rental
  attr_reader :person, :book
  attr_accessor :date

  def initialize(book, person, date)
    @date = date
    @person = person
    @book = book


    @person.rentals << self
    @book.rentals << self
  end

  def person=(person)
    @person = person
    person.add_rental(self)
  end

  def book=(book)
    @book = book
    book.add_rental(self)
  end
end

book1 = Book.new('The Lion and the Jewel', 'Wole Soyinka')
book2 = Book.new('Half of a Yellow Sun', 'Chimamanda Adichie')

person1 = Person.new(25, 'Alice')
person2 = Person.new(17, 'Bob')

rental1 = Rental.new(book1, person1, Date.today)
rental2 = Rental.new(book2, person2, Date.today)

puts rental1.date
puts rental1.book.title
puts rental1.person.name

puts rental2.date
puts rental2.book.title
puts rental2.person.name
