require_relative '../lib/contact-manager'
require_relative '../lib/output-manager'
require_relative '../lib/validator'


$myManager = ContactManager.new


def manage_creation
  clear_screen
  puts "\n========:========\nName of the new contact: "
  name = gets.chomp.downcase
  exit_program? name

  puts "Write #{name.capitalize}'s number: "
  number = gets.chomp
  exit_program? number
  if !valid_phone_number? number
    puts Settings::MESSAGES[:number_not_valid]
  end

  puts "Where does #{name.capitalize} live? "
  city = gets.chomp
  exit_program? city
  
  return {name: name, number: number, city: city}
end

def find_by_name
  clear_screen
  puts "\n========:========\nWhat contact do you want to find?"
  contact_to_find = gets.chomp
  puts "Finding #{contact_to_find.capitalize}..."
  $myManager.search_by_name contact_to_find
end

include OutputManager
include Validator
puts "=== Welcome to Contact Manager ==="

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

