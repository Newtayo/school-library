require './book'
require './student'
require './teacher'
require './rental'
require 'date'

class App
  def initialize
    @books = []
    @people = []
    @rental = []
  end

  def list_books
    if @books.empty?
      puts 'No book is available at the moment'
    else
      @books.each { |book| puts "#{book.title} by #{book.author}" }
    end
  end

  def list_people
    if @people.empty?
      puts 'Library does not have any member yet'
    else
      @people.each { |member| puts "[#{member.class.name}] name: #{member.name} age: #{member.age} id: #{member.id}" }
    end
  end

  def add_book
    puts 'Enter the title of the book'
    title = gets.chomp
    puts 'Enter the author of the book'
    author = gets.chomp
    new_book = Book.new(title, author)
    @books.push(new_book)
    puts 'Book added'
  end

  def add_student
    print 'Please enter the age of the student: '
    student_age = gets.chomp.to_i
    print 'Please enter the name of the student: '
    student_name = gets.chomp.to_s
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp.upcase
    if permission == 'Y'
      new_student = Student.new(student_age, student_name)
      @people.push(new_student)
      puts 'Student records successfully created'
    else
      puts 'Parent permission is required before you can proceed'
    end
  end

  def add_teacher
    print 'Please enter the age of the Teacher: '
    teacher_age = gets.chomp.to_i
    print 'Please enter the name of the Teacher: '
    teacher_name = gets.chomp.to_s
    print "Please enter the Teacher's specialization: "
    specialization = gets.chomp.to_s

    new_teacher = Teacher.new(teacher_age, specialization, teacher_name)
    @people.push(new_teacher)
    puts 'Teacher records successfully created'
  end

  def add_people
    print 'Do you want to create a student (1) or a teacher (2)? [input the number]: '

    selection = gets.chomp.to_i
    case selection
    when 1
      add_student
    when 2
      add_teacher
    else
      puts 'Enter a valid input'
    end
  end

  def rent_book
    puts 'Please Select a Book from the following List'
    @books.each_with_index do |book, index|
      puts "id: #{index} Title: #{book.title}  Author: #{book.author}"
    end
    select_book = gets.chomp

    puts 'Please Select the index number of the person renting the book'
    @people.each_with_index do |member, index|
      puts "Index No: #{index} [#{member.class.name}] name: #{member.name} age: #{member.age} id: #{member.id}"
    end

    select_person = gets.chomp
    current_date = Date.today
    puts current_date

    new_rental = Rental.new(@books[select_book], @people[select_person], current_date)
    @rental.push(new_rental)
  end

  def list_rental
    puts 'Enter a person ID:'
    person_id = gets.chomp.to_i

    person = @people.find { |individual| individual.id == person_id }
    rented_books = @rentals.select { |rents| rents.person == person }
    rented_books.each { |borrowed| puts "Book: #{borrowed.book.title}, Date: #{borrowed.date}" }
  end
end
