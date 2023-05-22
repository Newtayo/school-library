require './app'
class Main
  def main
    app = App.new

    loop do
      puts 'Choose an option:'
      puts '1. List all books'
      puts '2. List all people'
      puts '3. Create a person'
      puts '4. Create a book'
      puts '5. Create a rental'
      puts '6. List rentals for a given person ID'
      puts '7. Quit'
      choose_option(app)
    end
  end

  def choose_option(app)
    option = gets.chomp.to_i
    case option
    when 1
      app.list_books
    when 2
      app.list_people
    when 3
      app.add_people
    when 4
      app.add_book
    when 5
      app.rent_book
    when 6
      app.list_rental
    else
      puts 'Invalid option. Please try again.'
      exit
    end
  end
end

main_app = Main.new
main_app.main
