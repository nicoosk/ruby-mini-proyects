require_relative 'contact-manager'
require 'io/console'

$exit_keywords = ['e', 'exit']
$myManager = ContactManager.new

def add_prefix(number)
  return "+56" + number
end

def exit_program?(input)
  $exit_keywords.each do |keyword|
    if keyword == input
      puts "Exiting program..."
      sleep(1)
      puts "Done."
      sleep(0.1)
      exit
    end
  end
end

def clear_screen
  system 'clear'
end

def manage_creation()
  clear_screen
  puts "\n========:========\nName of the new contact: "
  name = gets.chomp.downcase
  exit_program?(name)

  puts "Write #{name.capitalize}'s number: "
  number = gets.chomp
  exit_program?(number)
  number = add_prefix(number)

  puts "Where does #{name.capitalize} live? "
  city = gets.chomp
  exit_program?(city)
  
  return {name: name, number: number, city: city}
end

def find_by_name
  clear_screen
  puts "\n========:========\nWhat contact do you want to find?"
  contact_to_find = gets.chomp
  puts "Finding #{contact_to_find.capitalize}..."
  $myManager.search_by_name contact_to_find
end

puts "=== Welcome to Contact Manager ==="

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

while true
  clear_screen
  show_menu
  choice = gets.chomp
  exit_program? choice
  if choice.downcase == "c"
    contact_info = manage_creation
    $myManager.add_contact(contact_info[:name], contact_info[:number], contact_info[:city])
    await_user_key_response
  elsif choice.downcase == "f"
    find_by_name
    await_user_key_response
  elsif choice.downcase == "v"
    puts "\n========:========\nListing all contacts..."
    sleep 0.5
    $myManager.view_contacts
    await_user_key_response
  else
    puts "'#{choice}' is not a valid option."
    await_user_key_response
    next
  end
end

