require 'io/console'

module OutputManager
  def show_menu
    puts "Contact Manager for Terminal"
    puts "\n========:========\n"
    puts "Please select an option:"
    puts "C: Create a new contact"
    puts "F: Find a contact by name"
    puts "V: View all contacts"
    puts "E: Exit"
    print "Your choice: "
  end
  
  def await_user_key_response
    puts "Press any key to continue..."
    STDIN.getch
  end

  def clear_screen
    system 'clear'
  end
end
