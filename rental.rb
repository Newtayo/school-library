require './person'
require './book'
require 'date'
class Rental
  attr_accessor :date
  attr_reader :person, :book

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
