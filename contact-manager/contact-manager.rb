require_relative 'contact'

class ContactManager
  def initialize
    @contacts = {}
  end

  def add_contact(name, number, city)
    id = rand(1000...10000)
    while @contacts.key?(id)
      id = rand(1000...10000)
    end

    @contacts[id] = Contact.new(id, name.downcase, number, city.downcase)
    puts ("Contact '#{name}' created succesfully.")
  end

  def view_contacts
    @contacts.each do |id, contact|
      list_contact contact
    end
  end
  
  def search_by_name(name)
    @contacts.each_value do |contact|
      if contact.name == name.downcase
        puts "Contact found. Listing..."
        sleep(1)
        list_contact contact
        break
      else
        puts "Contact not found. Please, search by a valid name."
      end
    end
  end

  def list_contact(contact)
    puts "ID: #{contact.id} \n  Name: #{contact.name.capitalize} \n  Number: #{contact.number} \n  City: #{contact.city.capitalize}"
  end
end